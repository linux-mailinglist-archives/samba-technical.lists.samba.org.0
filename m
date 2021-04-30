Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9E36FBE0
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 16:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=z+hQCOxrE+bCWqMODHkJef9tmoNNW9j9Ou8/xp7Ps+Q=; b=iC3MENsD9JWwIFFFPWKFCXR0PC
	8JrOJHfABsKt9cPQfjfY9K35tw5fO+58GZ9l9bh11Jn8LXc6fGW6MABcspfM6NAjNpqLK+x2MBppk
	P7HyVoEjmLsFLibbeVXFI9dK7lZ4uAEe/xOWsUQRFlJO5dDpZqMdupjGy0jR0tMOwA3wKuNhLqEIV
	NKuSg0jhQ1/Y1QTrZFl6Ky0qzrIrQkTLNDzVniqepR8vzmoW61SSSsHB0HLK+pQnMhvPbTXx8W7H1
	3fk0jTZh6jJVwV4X4arHjMRb4wYHBzImflKShSwcKWdCkFCqnMahoOB4YxrMk6OkcKTpdeNPbI1te
	dnsjSvZw==;
Received: from ip6-localhost ([::1]:45288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcTkv-00DJIp-01; Fri, 30 Apr 2021 14:04:33 +0000
Received: from [195.221.236.186] (port=49716 helo=smtp-out2.ac-dijon.fr) 
 by hr1.samba.org with esmtp (Exim) id 1lcTkp-00DJIi-UI
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 14:04:29 +0000
Received: from hermes.ac-dijon.fr (localhost [127.0.0.1])
 by smtp-out2.ac-dijon.fr (Postfix) with ESMTP id 0E994BCF
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 16:04:25 +0200 (CEST)
Received: from [10.0.0.154] (85-170-166-112.rev.numericable.fr
 [85.170.166.112])
 by hermes.ac-dijon.fr (Postfix) with ESMTPSA id 56860FE5
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 16:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ac-dijon.fr; s=smtp;
 t=1619791463; h=mime-version:from:date:message-id:subject:to;
 bh=z+hQCOxrE+bCWqMODHkJef9tmoNNW9j9Ou8/xp7Ps+Q=;
 b=BzF+X3Ywo/wW14QJgxa4ME41m+C2VEAzAmcp+RxxrrV7UdAm2REQkqX2W9SOrlWX4DW7VX
 b6zHDX8ju+D8tE2Jy695//bI7DYtYifVmcqjJABTbPRPOh+EOYRNCLQOZjtNNBvv/QzRG7
 KfCvjAHSQMNh7vqQOI9DGpEKLPUE/6UNywe9uuyvxjiXSEFtmI92FqQz9FciN8jUAbjhbg
 6IoIthjbdxd/MkfR/l5x6qZzIaA/f21OLPMWyMttmzzXLeVnfZYftvLFbNCAEVsm6kJ3CX
 +utJh/wWP/1I1x5mZNTNJxT+gpLuYLig5IKb4n70iHHkH4a4gh2hKgc9ZFXiFg==
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
Message-ID: <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
Date: Fri, 30 Apr 2021 16:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: fr
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

I'm sorry, I completly forgot to mention this :

root@dc1:~# dpkg -l |grep samba
ii  python3-samba                        2:4.11.6+dfsg-0ubuntu1.6 
    amd64        Python 3 bindings for Samba
ii  samba                                2:4.11.6+dfsg-0ubuntu1.6 
    amd64        SMB/CIFS file, print, and login server for Unix
ii  samba-common                         2:4.11.6+dfsg-0ubuntu1.6 
    all          common files used by both the Samba server and client
ii  samba-common-bin                     2:4.11.6+dfsg-0ubuntu1.6 
    amd64        Samba common files used by both the server and the client
ii  samba-dsdb-modules:amd64             2:4.11.6+dfsg-0ubuntu1.6 
    amd64        Samba Directory Services Database
ii  samba-libs:amd64                     2:4.11.6+dfsg-0ubuntu1.6 
    amd64        Samba core libraries
ii  samba-vfs-modules:amd64              2:4.11.6+dfsg-0ubuntu1.6 
    amd64        Samba Virtual FileSystem plugins

root@dc1:~# cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.2 LTS"

And Windows 10.20H2.


Le 30/04/2021 à 15:03, Klaas TJEBBES via samba-technical a écrit :
> Hello.
> 
> I am facing a problem with GPO managing on the Samba side.
> 
> When I create a GPO named "test" using the RSAT on Windows, I can then 
> Copy and Backup this GPO.
> 
> On the samba server, using "samba-tool gpo backup/restore", I backup and 
> restore this "test" GPO under another name, "blabla" for example.
> 
> Back in the RSAT on Windows, this new "blabla" GPO can NOT be Copied or 
> Backuped. The error is "invalid directory".
> 
> I CLOSE THE RSAT.
> 
> On the samba server, I go in the "test" GPO directory (in 
> "/home/sysvol/domseth.ac-test.fr/Policies/{ID_TEST_GPO}") and do :
>   getfattr -d -n user.DOSATTRIB -R . > ../test.attrs
> 
> Then I go in the directory of the "blabla" GPO and do :
>    setfattr --restore=../test.attrs
> 
> Then I return on the RSAT and now I can successful Copy and Backup 
> "blabla" GPO.
> 
> Why this problem ? Am I doing something wrong ?
> 
> 
> Thank you, regards,
>   Klaas
> 

