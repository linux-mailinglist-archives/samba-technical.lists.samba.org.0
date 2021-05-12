Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8EF37BFC0
	for <lists+samba-technical@lfdr.de>; Wed, 12 May 2021 16:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3rDGuJwYx0cWgDzsl84JkCSjOUNPSLWfz4XaQM0f39s=; b=SnATdHtiHY7LRI5C0u+BqpiTJF
	iVzi+0lBndsYN5Kul2kFp7uh6Hlqp4RCQ/mscl0e3VD4A5yxZJ8NeL/+X/Pk+G6SGpwdKHgLic/0/
	Y0eNrWIPs1KfKEfNJ9QSPOTncDZa3kHZOpgQhXGVrgTEZ4bu0rZTRgcR2ecrvK/o6/Ti2yJ4x3aQg
	MUo7i1KyPItkWWj+TSe/aeZeYYbyWWaN5yeTUhjC0gHiuoKE7yMqEAXuIahQHgM64ZPWI2q9XHqr+
	HS+V2KIo7P42WwHL7H1sM13B8aj3xcoOED0Z8pcDb81YyNIKpaMUcSmUqZXUP6Ma+MCk1rw1Z8qmW
	Vt3mBelg==;
Received: from ip6-localhost ([::1]:18448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lgphx-00HJtG-Ej; Wed, 12 May 2021 14:19:29 +0000
Received: from [195.221.236.186] (port=48126 helo=smtp-out2.ac-dijon.fr) 
 by hr1.samba.org with esmtp (Exim) id 1lgphs-00HJt6-HT
 for samba-technical@lists.samba.org; Wed, 12 May 2021 14:19:26 +0000
Received: from hermes.ac-dijon.fr (localhost [127.0.0.1])
 by smtp-out2.ac-dijon.fr (Postfix) with ESMTP id 30F92105D
 for <samba-technical@lists.samba.org>; Wed, 12 May 2021 16:19:21 +0200 (CEST)
Received: from [10.0.0.154] (85-170-166-112.rev.numericable.fr
 [85.170.166.112])
 by hermes.ac-dijon.fr (Postfix) with ESMTPSA id 6B587F95
 for <samba-technical@lists.samba.org>; Wed, 12 May 2021 16:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ac-dijon.fr; s=smtp;
 t=1620829159; h=mime-version:from:date:message-id:subject:to;
 bh=3rDGuJwYx0cWgDzsl84JkCSjOUNPSLWfz4XaQM0f39s=;
 b=RPxRVPxvTS4pMK1ttr4qXfLEZ2mtNFg1GXrUQjaOnr75cbHndK/mi7Hp0bfR2JuVNuvjYn
 cFwU5TFuNXMLx7eAo66spBGKl+MBGgAPPRmU+yZgp4+gMbWXmX76jbUtzPzU2PUUIJ4yoo
 6/TcZY7ilHh+6Gwb0+uPaLtvzdsK+ArdIeeXrIzW5ePuHCghxPSa+Fbs1Ao5TgEJ7CGyb4
 gVlFY5dNY4ndWW/xQEau1mTkMf9mJTYg4/0yXyllDIlxpcFoCmDXfeX91uFakh9NRdc9sS
 xvxv86R9tCzaa4/3AkYQH15ceOz+HSnnOUAvAqKJgJgNqsjJBLpy1GJ+L1pmDA==
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
 <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
Message-ID: <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
Date: Wed, 12 May 2021 16:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
From: Klaas TJEBBES via samba-technical <samba-technical@lists.samba.org>
Reply-To: Klaas TJEBBES <klaas.tjebbes@ac-dijon.fr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

It looks like I don't get very popular with my question here. But could 
at least someone test this to tell me if one can reproduce ?

* In RSAT create a new GPO and make a modification in it (I did : 
Computer Configuration -> Administrative Templates -> System -> Logon 
“Always Wait for the Network at Computer Startup and Logon” to “Enabled”)
* Close RSAT
* Backup GPO via samba-tool (in /tmp/...)
* Restore GPO via samba-tool (from /tmp/...) with another name
* In RSAT try to Copy this new GPO (right clic "Copy", right clic on 
"Group Policy Objects" and Paste)

I get "Invalid directory". Even doing it via powershell and debug and 
traces, hundreds of log lines, I couldn't figure out why it won't copy...


Regards,
  Klaas


Le 30/04/2021 à 16:04, Klaas TJEBBES via samba-technical a écrit :
> I'm sorry, I completly forgot to mention this :
> 
> root@dc1:~# dpkg -l |grep samba
> ii  python3-samba                        2:4.11.6+dfsg-0ubuntu1.6    
> amd64        Python 3 bindings for Samba
> ii  samba                                2:4.11.6+dfsg-0ubuntu1.6    
> amd64        SMB/CIFS file, print, and login server for Unix
> ii  samba-common                         2:4.11.6+dfsg-0ubuntu1.6    
> all          common files used by both the Samba server and client
> ii  samba-common-bin                     2:4.11.6+dfsg-0ubuntu1.6    
> amd64        Samba common files used by both the server and the client
> ii  samba-dsdb-modules:amd64             2:4.11.6+dfsg-0ubuntu1.6    
> amd64        Samba Directory Services Database
> ii  samba-libs:amd64                     2:4.11.6+dfsg-0ubuntu1.6    
> amd64        Samba core libraries
> ii  samba-vfs-modules:amd64              2:4.11.6+dfsg-0ubuntu1.6    
> amd64        Samba Virtual FileSystem plugins
> 
> root@dc1:~# cat /etc/lsb-release
> DISTRIB_ID=Ubuntu
> DISTRIB_RELEASE=20.04
> DISTRIB_CODENAME=focal
> DISTRIB_DESCRIPTION="Ubuntu 20.04.2 LTS"
> 
> And Windows 10.20H2.
> 
> 
> Le 30/04/2021 à 15:03, Klaas TJEBBES via samba-technical a écrit :
>> Hello.
>>
>> I am facing a problem with GPO managing on the Samba side.
>>
>> When I create a GPO named "test" using the RSAT on Windows, I can then 
>> Copy and Backup this GPO.
>>
>> On the samba server, using "samba-tool gpo backup/restore", I backup 
>> and restore this "test" GPO under another name, "blabla" for example.
>>
>> Back in the RSAT on Windows, this new "blabla" GPO can NOT be Copied 
>> or Backuped. The error is "invalid directory".
>>
>> I CLOSE THE RSAT.
>>
>> On the samba server, I go in the "test" GPO directory (in 
>> "/home/sysvol/domseth.ac-test.fr/Policies/{ID_TEST_GPO}") and do :
>>   getfattr -d -n user.DOSATTRIB -R . > ../test.attrs
>>
>> Then I go in the directory of the "blabla" GPO and do :
>>    setfattr --restore=../test.attrs
>>
>> Then I return on the RSAT and now I can successful Copy and Backup 
>> "blabla" GPO.
>>
>> Why this problem ? Am I doing something wrong ?
>>
>>
>> Thank you, regards,
>>   Klaas
>>
> 

-- 
~~~~~~~~~~~~~~~~~~~~~~~

- Klaas TJEBBES
- Equipe EOLE
- DSI
- Dijon

~~~~~~~~~~~~~~~~~~~~~~~


