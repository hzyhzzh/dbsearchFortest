package dbsearch.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "paper")
@Table
public class Paper {
	public Paper() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@ManyToOne
	@JoinColumn(name = "owner")
	private User owner;
	@Column
	private int fileStatus;
	public int getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(int fileStatus) {
		this.fileStatus = fileStatus;
	}

	@Column
	private Date uploadTime = new Date();
	
	public static final String[] STR_LIST = 
    {
    	"accidentName",//�¹����
    	"accidentTime",//�¹�ʱ��
    	"accidentLocation",//�¹ʵص�
    	"productor",//��Ʒ��������Ϣ
		"failureEquipment",//ʧЧ�豸
		"failureComponent",//ʧЧ����
		"applyEnv",//Ӧ�û���
    	"failureBehave",//ʧЧ��ʽ
		"failureCause",//ʧЧ����
		"failureMaterial",//ʧЧ��������
		"materialInfo",//ʧЧ������Ϣ
		"accidentDescription",//�¹ʸ���
		"analyseConclusion"//��������
    };
	
	// paper metadata
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "category")
	private Category category;
	@Column
	private String accidentName;
	@Column
	private String accidentTime;
	@Column(length = 25000)
	private String accidentLocation;
	@Column(length = 25000)
	private String accidentDescription;
	@Column(length = 25000)
	private String failureEquipment;
	@Column(length = 25000)
	private String failureComponent;
	@Column(length = 25000)
	private String failureBehave;
	@Column(length = 25000)
	private String failureCause;
	@Column(length = 25000)
	private String failureMaterial;
	@Column(length = 25000)
	private String materialInfo;
	@Column(length = 25000)
	private String analyseGoal;
	@Column(length = 25000)
	private String analyseMethod;
	@Column(length = 25000)
	private String analyseConclusion;
	@Column(length = 25000)
	private String productor;
	@Column(length = 25000)
	private String applyEnv;
	@Column(length = 25000)
	private String filePath;
	//图片路径
	private String picPath="";
	
	public String getpicPath(){
		return picPath;
	}
	
	
	public int getId() {
		return id;
	}
	
	public void setpicPath(String picPath){
		this.picPath = picPath;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getAccidentName() {
		return accidentName;
	}

	public void setAccidentName(String accidentName) {
		this.accidentName = accidentName;
	}

	public String getAccidentTime() {
		return accidentTime;
	}

	public void setAccidentTime(String accidentTime) {
		this.accidentTime = accidentTime;
	}

	public String getAccidentLocation() {
		return accidentLocation;
	}

	public void setAccidentLocation(String accidentLocation) {
		this.accidentLocation = accidentLocation;
	}

	public String getAccidentDescription() {
		return accidentDescription;
	}

	public void setAccidentDescription(String accidentDescription) {
		this.accidentDescription = accidentDescription;
	}

	public String getFailureEquipment() {
		return failureEquipment;
	}

	public void setFailureEquipment(String failureEquipment) {
		this.failureEquipment = failureEquipment;
	}

	public String getFailureComponent() {
		return failureComponent;
	}

	public void setFailureComponent(String failureComponent) {
		this.failureComponent = failureComponent;
	}

	public String getFailureBehave() {
		return failureBehave;
	}

	public void setFailureBehave(String failureBehave) {
		this.failureBehave = failureBehave;
	}

	public String getFailureCause() {
		return failureCause;
	}

	public void setFailureCause(String failureCause) {
		this.failureCause = failureCause;
	}

	public String getFailureMaterial() {
		return failureMaterial;
	}

	public void setFailureMaterial(String failureMaterial) {
		this.failureMaterial = failureMaterial;
	}

	public String getMaterialInfo() {
		return materialInfo;
	}

	public void setMaterialInfo(String materialInfo) {
		this.materialInfo = materialInfo;
	}

	public String getAnalyseGoal() {
		return analyseGoal;
	}

	public void setAnalyseGoal(String analyseGoal) {
		this.analyseGoal = analyseGoal;
	}

	public String getAnalyseMethod() {
		return analyseMethod;
	}

	public void setAnalyseMethod(String analyseMethod) {
		this.analyseMethod = analyseMethod;
	}

	public String getAnalyseConclusion() {
		return analyseConclusion;
	}

	public void setAnalyseConclusion(String analyseConclusion) {
		this.analyseConclusion = analyseConclusion;
	}

	public String getProductor() {
		return productor;
	}

	public void setProductor(String productor) {
		this.productor = productor;
	}

	public String getApplyEnv() {
		return applyEnv;
	}

	public void setApplyEnv(String applyEnv) {
		this.applyEnv = applyEnv;
	}

	public String getFilePath(){
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Paper))
			return false;
		Paper other = (Paper) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
