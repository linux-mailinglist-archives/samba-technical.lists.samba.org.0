Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162D29169
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 09:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lMNjtLPw1YoBvRwzMXi8V6g4HjkkBvxJ/oVb0D/ySJo=; b=L0sO2eUKG9iJncn9uOJyP9iW9H
	YNofV228uqa7PmWIO0hVWb/VZJIvNnrG9/ogGnP+2mqG0b032AXWWWYX2D0EJsDAjkDVXxrhqNRfu
	IxO8j3WZXRE6xOwdzelKL+EKf+rePJ0TTao9bKl0dGgnyADAKwhEY+jg0ZXVtmd3prl0Lc6pCgVYu
	R6KVqUub1VUAnrH5CmeWUp53xAXZFOSqtkADWjrox0i7e9jFUx7dxlPyMaX2b7rmZ0udjZDOi1Qm1
	iq4n5K1DmH8qdOE//mCoMlTMos1iXgoTrbSNNdPJNLOiV1NYdNhfolalM0EtO8ixXbjdc/cL1nCOa
	s1/rkp2Q==;
Received: from localhost ([::1]:33988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hU4C7-001XAD-C0; Fri, 24 May 2019 07:00:47 +0000
Received: from e2i64.smtp2go.com ([103.2.140.64]:46395) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hU4Bu-001XA6-MJ
 for samba-technical@lists.samba.org; Fri, 24 May 2019 07:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=Feedback-ID:X-Smtpcorp-Track:Date:Message-ID:From:
 To:Subject:Reply-To:Sender:List-Unsubscribe;
 bh=lMNjtLPw1YoBvRwzMXi8V6g4HjkkBvxJ/oVb0D/ySJo=; b=K6oqsR94HC73+Z5csdhp001xz5
 vLfTbhhP7+AHZWxWSXaYwZ7e0NvJz40Rc/ZH9narBLHTAXSucdKJK6eYtQnZDY77cyHIO9OA89RSJ
 qQL9jdqIzTSAEOphc/l1SF+C31GdfmSn6BoRlb6pxwYvZniY66tYLHp5sS+Q9DGqIvoHGkC7v7bdB
 wSODgqApT1xie9AEPM2A6NomvBpdVIZayj8NpiK8lpx6PTRhOHdNEvp0DwYkRS9qqBejB6U7OcNGj
 z9pNqUrCvwVuGT2aQSLXTAMr94HNOFYc2PSq2kmFViDa2yeEQl8l/DpS+KqDocPRIE+vt0sGRTX8j
 N9VdIluw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linagora.com;
 i=@linagora.com; 
 q=dns/txt; s=s266739; t=1558681234; h=from : subject : to : message-id 
 : date; bh=lMNjtLPw1YoBvRwzMXi8V6g4HjkkBvxJ/oVb0D/ySJo=; 
 b=h5rSM6wBRqvOcUdXXGGRM/zdbh9daln6pfvGlD3VFBrJcggTRoL6UklZDEj2K2Q9xgJGZ2
 ZQQ0P/Zn48pUJlyaLeVzp35tpp1YqSRCZ+lJwU4/mnCPJyb81R8upFwa1T0kZYmIIIfk/XEH
 ZqcVyWM69A+zOGVeLO/jmvQyECbFaCJncFvyRtEwo439wg+zoglVcGaFMtnD31J88ELJGmg0
 nWYVPVgeCobTDlFlJZi9Sq7XXnYGrjyeXuoE25+S9rNGBti6N5iSgIQQc+0d3kCVzfC8EXsG
 cFeHQCLDx5HhwVh19PGZYKD9vIfr3feu1NxP3RD2jDkt3MdBaPr5wNdg==
Received: from [10.173.255.233] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.91) (envelope-from <jrope@linagora.com>) id 1hU4Br-cp4ZWX-DZ
 for samba-technical@lists.samba.org; Fri, 24 May 2019 07:00:31 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
 by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.91) (envelope-from <jrope@linagora.com>) id 1hU4Bq-IbZspE-By
 for samba-technical@lists.samba.org; Fri, 24 May 2019 07:00:30 +0000
Received: from [192.168.0.101] (ver27-4-78-199-57-193.fbx.proxad.net
 [78.199.57.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.linagora.com (Postfix) with ESMTPSA id B28BF41746
 for <samba-technical@lists.samba.org>; Fri, 24 May 2019 09:00:28 +0200 (CEST)
Subject: Re: samba-tool fsmo transfer - uncaught exception
To: samba-technical@lists.samba.org
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
X-LINAGORA-Copy-Delivery-Done: 1
Message-ID: <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
Date: Fri, 24 May 2019 09:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
X-Smtpcorp-Track: 1hl4UqmPZspEUy.5yaeWUJLg
Feedback-ID: 266739m:266739aja3LFS:266739sW2zttGd57
X-Report-Abuse: Please forward a copy of this message, including all headers, 
 to <abuse-report@smtp2go.com>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?UTF-8?Q?Julien_Rop=c3=a9?= via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Julien_Rop=c3=a9?= <jrope@linagora.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

 > Can I ask just what is the exact command you are running ?


Here they are :

samba-tool fsmo transfer --role= forestedns -U administrator

samba-tool fsmo transfer --role= domaindns -U administrator


Transferring other roles doesn't cause an issue, but as I understand, 
only the DNS-related roles require the drs_utils module.


Note that the transfer seems to be effective in the end, as shown with 
the command "samba-tool fsmo show". But this exception makes me think 
that something did not complete.



Le 23/05/2019 à 19:38, Rowland penny via samba-technical a écrit :
> On 23/05/2019 14:48, Julien Ropé via samba-technical wrote:
>> Hi,
>>
>> I have been confronted to a problem with role transfers for forestdns 
>> and domaindns.
>> Using the command "samba-tool fsmo transfer [...]", I get an error :
>>
>> ERROR(<type 'exceptions.AttributeError'>): uncaught exception - 
>> 'module' object has no attribute 'drs_utils'
>> File "/usr/lib/python2.7/dist-packages/samba/netcmd/__init__.py", 
>> line 177, in _run
>> return self.run(*args, **kwargs)
>> File "/usr/lib/python2.7/dist-packages/samba/netcmd/fsmo.py", line 
>> 528, in run
>> transfer_dns_role(self.outf, sambaopts, credopts, role, samdb)
>> File "/usr/lib/python2.7/dist-packages/samba/netcmd/fsmo.py", line 
>> 133, in transfer_dns_role
>> except samba.drs_utils.drsException as e:
>>
>>
>>
>> This is using Samba 4.9.
>>
>> Looking on the net, I found several references of the same, dating as 
>> far as 2016 :
>>
>> https://lists.samba.org/archive/samba/2016-September/203363.html
>>
>> https://lists.samba.org/archive/samba/2017-August/210120.html
>>
>> http://samba.2283325.n4.nabble.com/samba-4-7-0-AD-DC-FSMO-roles-transfer-error-td4725099.html 
>>
>>
>>
>>
>> These show the error was found in 4.5, 4.6 and 4.7.
>>
>> Each time, the solution was to modify the file 
>> "[samba]/lib/python27/site-packages/samba/netcmd/fsmo.py", by adding 
>> the line "import samba.drs_utils".
>> I have verified that this fixes the issue for me.
>>
>>
>> I understand the problem is not seen in every environment, but it 
>> still seems to be there for some users.
>> If this issue is known and the fix is so easy, why isn't it applied?
>> If this is because there is something wrong with the environments of 
>> the people that see it, what should they (we) do to fix it? Is 
>> editing the code ourselves a good solution, or does that hide 
>> something else we should look at in our environment?
>>
> Can I ask just what is the exact command you are running ?
>
> Rowland
>
>
>
>
>
-- 
Julien ROPÉ
Support OSSA
Tél : 06.38.99.80.22 / 01 46 96 63 63
Courriel : jrope@linagora.com
www.linagora.com
--
Message envoyé grâce à OBM, la Communication Libre par Linagora

