Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55028482
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 19:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XtgmCyl6ifHZ+NgiED/3q2Nh+D46WjrCkAOEv7vW9Dk=; b=0pYHKxxWMLxaxmREITLSpephId
	169cxxX36XnTyCJ3CNsRUEOYbhObZvNs2EbMrKkiF/yiaZS40IIWOCW8kt7OU60Ovc01RsyU/6BpW
	eGhKEuSrOFh5bHt03oLqroQueU5c1pGA+5fcJYMJaUkCg+cO4/lS8w+AbszRWERH9d5D1/vuWGHE+
	/BXEHjNXyNPy4BnKS8KzhN7JwJL6EXRXQ1Ep9yIjGdFySued9M0x5cE9Q3ApeG1Q+28JVBJnjda46
	beMqmvC8KtkKYGz9Y0ZoCvdrEUPOMO0CIutOJqRe7hMfJSP8oa6kqoYhw7Qns7vNUeYVAc7ZLvY2W
	Q+AkYBhQ==;
Received: from localhost ([::1]:47320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTrAS-001Rgh-1z; Thu, 23 May 2019 17:06:12 +0000
Received: from e2i64.smtp2go.com ([103.2.140.64]:56741) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTrAM-001Rga-S6
 for samba-technical@lists.samba.org; Thu, 23 May 2019 17:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=Feedback-ID:X-Smtpcorp-Track:Date:Message-ID:
 Subject:To:From:Reply-To:Sender:List-Unsubscribe;
 bh=XtgmCyl6ifHZ+NgiED/3q2Nh+D46WjrCkAOEv7vW9Dk=; b=FTuUeaYxV5ddrSDMEQL1Bj4i30
 +qWFK8x5z2MzEDCZA+R9hLideORg5yGJzYJghSE66ILnD0FVUfqwJ62H7irhoaxQkr0cinVvx1JTb
 FdwdWwmA/gU5jNaElKV0IBlsZ/gARnS+iblDL/xQ0poTW2ttHxWm/dQCd+E1E5sguhbxYUXhROJLt
 rJPx/+x40RrQOSkd8PhL+74bpRKCsZzyt6gcsS0uFecGKsI30mf90hPxuMLrgpFNASWKrCXY1eG93
 qACXQP0aIR4o+t7ChLvfZIvb/lfufyEJTYTDDOe68kV+Zi+4zJGXYyzG2wUTMBIgdgaUnzFU1gK9q
 bjEI3igw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linagora.com;
 i=@linagora.com; 
 q=dns/txt; s=s266739; t=1558631167; h=from : subject : to : message-id 
 : date; bh=XtgmCyl6ifHZ+NgiED/3q2Nh+D46WjrCkAOEv7vW9Dk=; 
 b=i0m2LYNMTdIFlzh+DuI24lJiVW6Jt5xMCr9qEfHM449Jdv3zCUw8rS3x/vqjglHvF36mvw
 ivTc6elbwemrbfTl652U6QlcDmeDCzr3PtNthxN2QRT+M5e2MyUOpn8hxJtTmV4bLH7enCAt
 lOCg8DCIxHCo3bs/mA2R9Be7kuuY6ubkGpBJ6LMK+V5kWIKp/N/EpT91P+KdlNF/Kwyn1Eo0
 wPuTr7jV27ojDhVRNhBAfD8iv2opa3MIY3qqBAGPxyQgIPEOg7P/llLRO98/1KuLJ+/FG6jF
 UzD80JH07hoTsntNwsMzVT9nBO1FnjWPVgNR6B6y+GGq4myzeAVhUwvw==
Received: from [10.66.228.43] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.91) (envelope-from <jrope@linagora.com>) id 1hTo5B-cp4Tr5-Qt
 for samba-technical@lists.samba.org; Thu, 23 May 2019 13:48:33 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
 by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.91) (envelope-from <jrope@linagora.com>) id 1hTo5A-wSERny-Nr
 for samba-technical@lists.samba.org; Thu, 23 May 2019 13:48:32 +0000
Received: from [192.168.0.101] (ver27-4-78-199-57-193.fbx.proxad.net
 [78.199.57.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.linagora.com (Postfix) with ESMTPSA id 8000E4171B
 for <samba-technical@lists.samba.org>; Thu, 23 May 2019 15:48:31 +0200 (CEST)
X-LINAGORA-Copy-Delivery-Done: 1
To: samba-technical@lists.samba.org
Subject: samba-tool fsmo transfer - uncaught exception
Message-ID: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
Date: Thu, 23 May 2019 15:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Smtpcorp-Track: 1hTo5jwSERnyNr.5hSxNMSmE
Feedback-ID: 266739m:266739aja3LFS:266739sZTo66v66W
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

Hi,

I have been confronted to a problem with role transfers for forestdns 
and domaindns.
Using the command "samba-tool fsmo transfer [...]", I get an error :

ERROR(<type 'exceptions.AttributeError'>): uncaught exception - 'module' 
object has no attribute 'drs_utils'
File "/usr/lib/python2.7/dist-packages/samba/netcmd/__init__.py", line 
177, in _run
return self.run(*args, **kwargs)
File "/usr/lib/python2.7/dist-packages/samba/netcmd/fsmo.py", line 528, 
in run
transfer_dns_role(self.outf, sambaopts, credopts, role, samdb)
File "/usr/lib/python2.7/dist-packages/samba/netcmd/fsmo.py", line 133, 
in transfer_dns_role
except samba.drs_utils.drsException as e:



This is using Samba 4.9.

Looking on the net, I found several references of the same, dating as 
far as 2016 :

https://lists.samba.org/archive/samba/2016-September/203363.html

https://lists.samba.org/archive/samba/2017-August/210120.html

http://samba.2283325.n4.nabble.com/samba-4-7-0-AD-DC-FSMO-roles-transfer-error-td4725099.html



These show the error was found in 4.5, 4.6 and 4.7.

Each time, the solution was to modify the file 
"[samba]/lib/python27/site-packages/samba/netcmd/fsmo.py", by adding the 
line "import samba.drs_utils".
I have verified that this fixes the issue for me.


I understand the problem is not seen in every environment, but it still 
seems to be there for some users.
If this issue is known and the fix is so easy, why isn't it applied?
If this is because there is something wrong with the environments of the 
people that see it, what should they (we) do to fix it? Is editing the 
code ourselves a good solution, or does that hide something else we 
should look at in our environment?


Best regards,
Julien

--
Message envoyé grâce à OBM, la Communication Libre par Linagora

