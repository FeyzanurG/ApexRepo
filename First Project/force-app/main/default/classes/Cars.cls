public class Cars {
    
    //Properties
    private Integer model;
    private String color;
    private String packet;
    private Integer maxSpeed;
    private Integer speed = 0;
    private Integer brake = 0;
    
    
    //Constructor Method
    
    public Cars(){
        System.debug('Constructor Method without parameter');
    }
    public Cars(Integer model,String color,String packet,Integer maxSpeed){ 
        this();
        setModel(model);
        setColor(color);
        setPacket(packet);
        setMaxSpeed(maxSpeed);
        
        System.debug('MODEL: '+ model+
             '\nCOLOR: '+color+
             '\nPACKET: '+packet+
             '\nMAXSPEED: '+maxSpeed+'kmh'
            );
    }
    
    //Setter Methods
    public void setModel(Integer model){
        this.model = model;
    }
    public void setColor(String color){
        this.color = color;
    }
    public void setPacket(String packet){
        this.packet = packet;
    }
    public void setMaxSpeed(Integer maxSpeed){
        this.maxSpeed = maxSpeed;
    }
    
    //Getter Methods
    
    public Integer getModel(){
        return model;
    }
    public String getColor(){
        return color;
    }
    public String getPacket(){
        return packet;
    }
    public Integer getMaxSpeed(){
        return maxSpeed;
    }
    
    public void run(){
        System.debug('The Vehicle is running.');
        
    }
    public void stop(){
        system.debug('The Vehicle is stopped.');
    }
    
    public Integer acceleration(Integer accelerate){
        speed = accelerate + speed;
        if(speed<maxSpeed){
            System.debug('Current Speed: '+speed+' kmh');
        }else{
            System.debug('Current Speed: '+maxSpeed);
        }
        
        return speed;
        
    }
    
    public Integer brake(Integer brake){
        speed = speed - brake;
        if(speed>0){
            System.debug('Current Speed: '+speed);
        }else{
            
            System.debug('Current Speed : 0');
        }
        
        return speed;
    }
    
 
    
    
    
    
    
    
}