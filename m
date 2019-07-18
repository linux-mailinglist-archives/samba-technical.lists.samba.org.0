Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 653636CB94
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 11:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QwdGsdp+1OgmPpwJ8Gc1+9MSmwui2y0JetP1496rUlI=; b=i24dtrx3kmQrIUzGE7Weg1O98B
	cEpsS1ovTCtpRBc05YyUaMIxlz/LPnf6rpvDEaJe5914c9fIVbzBGJ9QWHUvNJUPWQCtX11UATiAx
	x3c9jFUmKzSgOlHoL6KKl5MWjQTFaC62J6ZdgPhehTDtz75Mq3Z2srJ3fJ5yDXDnL7gkROpENwRwQ
	iQLUamES6W8ctCt905a517IstpOV01Gmsm7a2K7IN3A4FMcHvl0Yrb4kuYDUBwqsHGkC9kN8kFQLc
	MC6Jtiqhqk5TG+Y264XEB7HOmtFifQ7O+3ZB21flJc1zky9auPC2Sr4u7J35MndfAHYw+WqNXW4mh
	/bZYarWA==;
Received: from localhost ([::1]:62858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ho2S5-000lvA-15; Thu, 18 Jul 2019 09:11:49 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ho2Rz-000lv3-O5
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 09:11:46 +0000
Received: by mail-pf1-f196.google.com with SMTP id q10so12312368pff.9
 for <samba-technical@lists.samba.org>; Thu, 18 Jul 2019 02:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=QwdGsdp+1OgmPpwJ8Gc1+9MSmwui2y0JetP1496rUlI=;
 b=BYWan2ona2kVEGqucpK1uPdIfK1S0kx5BxDrsYjmjytrT6k+2AYftPVsEGGOhbgzrO
 mWV8MDiVXmMoVdibtLys9Ml5KCtbfNksFniioeDl1TGkfZA9ymqqobS/bxxkN1M0sxv5
 le47DDZh8l8ka04YoojROiPN7+eExQZz6TIuM5ftr9M6G+Ll0n6b02wpqPFb+/WJdXGE
 ybRN/CCu7/hWt63d983Q5mtu8lNuXjb8/CynIpe3sCbiiyycfM/Z4+MJ1kS+kqxh6t1B
 Y429s5w7MQtbGeRz3oAAFRr7XbMQpIZq2Q3nIZ9sDCKss4IUNQ0ku46zflJSpEaY3z9q
 kMig==
X-Gm-Message-State: APjAAAU1ZATLpHmIwtk3g5J+NI0ftlJXyyCh8DWslmZOAudchiFxuiRw
 Jw3SdRYwAedegyskLydlAhSZQgUV8vdHJQ==
X-Google-Smtp-Source: APXvYqxlPpQLQx3HSDqAWVfw1LtGqIhpAFTt+EsTcDsvml4Qph4aylr+EDEUjdIbLuVC6vwYLB61dA==
X-Received: by 2002:a63:1455:: with SMTP id 21mr3215091pgu.116.1563441090247; 
 Thu, 18 Jul 2019 02:11:30 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id v27sm34816879pgn.76.2019.07.18.02.11.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 02:11:28 -0700 (PDT)
Subject: Re: [PATCH] samba-tool: Fix traceback in samba-tool ntacl subcommands
To: Alexander Bokovoy <ab@samba.org>
References: <d0fa6fcc-08ea-26cb-621e-fac39428fc63@redhat.com>
 <20190718074741.GA11484@onega.vda.li>
Message-ID: <74b1aa22-ee6c-74f2-58b5-f5e8d36ca451@redhat.com>
Date: Thu, 18 Jul 2019 14:41:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190718074741.GA11484@onega.vda.li>
Content-Type: multipart/mixed; boundary="------------304B7F2BAF8993049C9781FA"
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------304B7F2BAF8993049C9781FA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Thanks ab. raised CommandErrror, and message


On 07/18/2019 01:17 PM, Alexander Bokovoy wrote:
> On to, 18 heinä 2019, Amit Kumar via samba-technical wrote:
>> # samba-tool ntacl sysvolcheck
>> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py",
>> line 177, in _run
>>     return self.run(*args, **kwargs)
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line
>> 265, in run
>>     domain_sid = security.dom_sid(samdb.domain_sid)
>>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in
>> get_domain_sid
>>     return dsdb._samdb_get_domain_sid(self)
>>
>> # samba-tool ntacl sysvolreset
>> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py",
>> line 177, in _run
>>     return self.run(*args, **kwargs)
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line
>> 210, in run
>>     domain_sid = security.dom_sid(samdb.domain_sid)
>>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in
>> get_domain_sid
>>     return dsdb._samdb_get_domain_sid(self)
>>
>> Signed-off-by: Amit Kumar <amitkuma@redhat.com>
>> ---
>>  python/samba/netcmd/ntacl.py | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
>> index 4cc7737ae77..dfcc8bd4d8f 100644
>> --- a/python/samba/netcmd/ntacl.py
>> +++ b/python/samba/netcmd/ntacl.py
>> @@ -393,7 +393,11 @@ class cmd_ntacl_sysvolreset(Command):
>>          elif use_s3fs:
>>              use_ntvfs = False
>>  
>> -        domain_sid = security.dom_sid(samdb.domain_sid)
>> +        try:
>> +            domain_sid = security.dom_sid(samdb.domain_sid)
>> +        except Exception as e:
>> +            print("domain_sid not returned,",e)
>> +            return
> I think it is better to raise CommandError() exception here instead.
> Pretty much like below with 'Unable to open samdb':
>
>>  
>>          s3conf = s3param.get_context()
>>          s3conf.load(lp.configfile)
>> @@ -448,7 +452,11 @@ class cmd_ntacl_sysvolcheck(Command):
>>          except Exception as e:
>>              raise CommandError("Unable to open samdb:", e)
> ^^ Here.
>
> Also, please use 'Cannot retrieve domain SID' as a friendly message
> instead of 'domain_sid not returned'.
>
> Same applies to the second patch.
>
>>  
>> -        domain_sid = security.dom_sid(samdb.domain_sid)
>> +        try:
>> +            domain_sid = security.dom_sid(samdb.domain_sid)
>> +        except Exception as e:
>> +            print("domain_sid not returned,",e)
>> +            return
>>  
>>          provision.checksysvolacl(samdb, netlogon, sysvol,
>>                                   domain_sid,
>> -- 
>> 2.17.1
>>
>>
>> Opened MR: https://gitlab.com/samba-team/samba/merge_requests/650
>>
>> From 646c9d78413d59399636d1ca14cad65341b912c6 Mon Sep 17 00:00:00 2001
>> From: Amit Kumar <amitkuma@redhat.com>
>> Date: Fri, 19 Jul 2019 00:43:58 +0530
>> Subject: [PATCH] samba-tool: Fix traceback in samba-tool ntacl subcommands
>>
>> # samba-tool ntacl sysvolcheck
>> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py", line 177, in _run
>>     return self.run(*args, **kwargs)
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 265, in run
>>     domain_sid = security.dom_sid(samdb.domain_sid)
>>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in get_domain_sid
>>     return dsdb._samdb_get_domain_sid(self)
>>
>> # samba-tool ntacl sysvolreset
>> ERROR(runtime): uncaught exception - samdb_domain_sid failed
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py", line 177, in _run
>>     return self.run(*args, **kwargs)
>>   File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 210, in run
>>     domain_sid = security.dom_sid(samdb.domain_sid)
>>   File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in get_domain_sid
>>     return dsdb._samdb_get_domain_sid(self)
>>
>> Signed-off-by: Amit Kumar <amitkuma@redhat.com>
>> ---
>>  python/samba/netcmd/ntacl.py | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
>> index 4cc7737ae77..dfcc8bd4d8f 100644
>> --- a/python/samba/netcmd/ntacl.py
>> +++ b/python/samba/netcmd/ntacl.py
>> @@ -393,7 +393,11 @@ class cmd_ntacl_sysvolreset(Command):
>>          elif use_s3fs:
>>              use_ntvfs = False
>>  
>> -        domain_sid = security.dom_sid(samdb.domain_sid)
>> +        try:
>> +            domain_sid = security.dom_sid(samdb.domain_sid)
>> +        except Exception as e:
>> +            print("domain_sid not returned,",e)
>> +            return
>>  
>>          s3conf = s3param.get_context()
>>          s3conf.load(lp.configfile)
>> @@ -448,7 +452,11 @@ class cmd_ntacl_sysvolcheck(Command):
>>          except Exception as e:
>>              raise CommandError("Unable to open samdb:", e)
>>  
>> -        domain_sid = security.dom_sid(samdb.domain_sid)
>> +        try:
>> +            domain_sid = security.dom_sid(samdb.domain_sid)
>> +        except Exception as e:
>> +            print("domain_sid not returned,",e)
>> +            return
>>  
>>          provision.checksysvolacl(samdb, netlogon, sysvol,
>>                                   domain_sid,
>> -- 
>> 2.17.1
>>
>


--------------304B7F2BAF8993049C9781FA
Content-Type: text/x-patch;
 name="0001-1.-Changing-exception-message.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-1.-Changing-exception-message.patch"

From ef2e38b5ea2400d45b7aee733f80c074944b2dc1 Mon Sep 17 00:00:00 2001
From: amit kumar <amitkuma@redhat.com>
Date: Thu, 18 Jul 2019 08:58:51 +0000
Subject: [PATCH] 1. Changing exception message. 2. raising CommandError
 instead of print

---
 python/samba/netcmd/ntacl.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
index dfcc8bd4d8f..b7ceb959907 100644
--- a/python/samba/netcmd/ntacl.py
+++ b/python/samba/netcmd/ntacl.py
@@ -396,8 +396,7 @@ class cmd_ntacl_sysvolreset(Command):
         try:
             domain_sid = security.dom_sid(samdb.domain_sid)
         except Exception as e:
-            print("domain_sid not returned,",e)
-            return
+            raise CommandError("Cannot retrieve domain SID", e)
 
         s3conf = s3param.get_context()
         s3conf.load(lp.configfile)
@@ -455,8 +454,7 @@ class cmd_ntacl_sysvolcheck(Command):
         try:
             domain_sid = security.dom_sid(samdb.domain_sid)
         except Exception as e:
-            print("domain_sid not returned,",e)
-            return
+            raise CommandError("Cannot retrieve domain SID", e)
 
         provision.checksysvolacl(samdb, netlogon, sysvol,
                                  domain_sid,
-- 
2.17.1


--------------304B7F2BAF8993049C9781FA--

