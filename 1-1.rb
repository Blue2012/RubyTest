
str1="string"
str2="string"

str1.object_id	#=> 84640: ���镶����I�u�W�F�N�g
str2.object_id	#=> 84620: �قȂ镶����I�u�W�F�N�g
str1 == str2 #=> true: ���e�͓���
str1.equal?(str2) #=> false: ���e�͓����ł��I�u�W�F�N�g�Ƃ��Ă͈قȂ�
