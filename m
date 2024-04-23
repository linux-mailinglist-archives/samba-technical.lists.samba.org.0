Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D958AEB3D
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 17:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=kUlkL4wHxCdLSZRXavhemhG3+xVG6ff28kKwlrgsX78=; b=q6K7qVM/soKGwZq+RCH4EWrVYN
	nfEeO4ocQDEKOoRPE+Tbqu105YXhwal+2syinH3QXkjoNkp0NVXPElxA0GV7B0JamwQyv/CvUg2u0
	P5UpTjEifdHs8VCNsUmGvmig13/JFcp8WjFnCmtM/mGwuo2azGl2GPqG2yXg35hfVusXqz5UE4Xo3
	VaArN/O3kDxqNKFEcIqdq1BrZzHRVlx/zgVXqdMAKFhNnDNNQXrQN9lfjS6E4nowo7j9HJ82ZCWB/
	D3Tnig4eGDMVowHRsEwhancRbmflcigSPQbrUYuXHwItTd8p9fId3hynr3F+iRWSO61ixOVofdjEH
	b0pNFEtg==;
Received: from ip6-localhost ([::1]:46552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzIDV-005Siz-T3; Tue, 23 Apr 2024 15:37:57 +0000
Received: from sonic312-23.consmr.mail.ne1.yahoo.com ([66.163.191.204]:40562) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rzIDR-005Sis-1R
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 15:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1713886669; bh=kUlkL4wHxCdLSZRXavhemhG3+xVG6ff28kKwlrgsX78=;
 h=From:To:References:In-Reply-To:Subject:Date:From:Subject:Reply-To;
 b=MZRWXyA7uCilKOCv9bJ0f7bFudZ8W2GUARw+9TGz6MWIQS8qJ2iPuaoA8n2KGsgrWkg8W6aqhcqUeu7nNRglFHw/l8TFkAqwLF+jlgbdkXd/lcdB2Pk50agDXTF4G7JjNWTgE6XhnqmDdbb1ZYdy/CSAG5rV/gnu5x6Q5N5dT/a+KIg1W1eVXT0s24mcs9PPz9crpfc79brgUtB28kkc/G3YPrLuQd2wFMlly4twF2Jw0aQoPv8R/DAV1Iml0fodThmmbGME3NigRhNyAi4+ibk0h6una1tR36XevxaePcglDFvD2BClGa92OM1iQQFSH98OnLV1m4gJrJo3IIABnw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713886669; bh=4IsFzMlG7tZhUtBXsAKKwGEW0CAUi2kmqbvcWAtaCT+=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=VOEVZ0Dz6VvOzgpJLdNPbURMoTu8464uRhlY8AdZUVRGxtVJ7zHLyUHblc2P7Qx7EJC0GtsowaNTzD/n/bjUh2ZvzRFurndd4DyV0HI5KHk1Z7EGUDTbRAllRFfD+sqNIWvRNxJgkEUyt4fBsf9GeDdRO7mIXnjl9fUuLZw5nsa+bPeTfOnzNlVOM9ydUydo9Xk9OorShiCRGq2f/KcyttKeQgntkgb4Xj0G0WlUiOtUZT+7na/ztta9pBVYHtBdNqoKEU3uhflQSVeUm7LS+JbhuuMPOrJkzOidxPhAzR6T6WoQ1NDjxMYxnjt/aRZW4AG7h+at1kwOEhyCt3PX+A==
X-YMail-OSG: PCVY1GAVM1mNFDQlJZDA1Nn9Sga5rYJqI8Mwyv.LVKQuy_efMQej1Cq8xVlaM5i
 RKjkvuvmue0pPgNJn_HfW2_gtuXMIKsaNvVJWrzpMVvo_9pOeO_xjDUkKbZ5r8_UitxlkS18XyQD
 9cUuHp10tr3.5ADKGVXU1ZxgDOri.Rzz0KH1hEWr4KN1s0Nhux1cSrMgW3aDYfb0vn9GsWC6g4dc
 QaDhW23MaC.Ti8uCfcB9qMxf6OFF9ARi8jOIWbSvg0RR62_wae9dpWeKWrR2hnslFbMK37FxgMHt
 fI_76yez.0GyVAvXNWVkNzXjXBbaleBZ0zymfC0gPPKvhNODQjRdkV7Jk.WlYYE0BPLVzo37hIsw
 T6RYiTubiXdlNba.TMGJByyb2ltKMpjS8Q7oPkpdFoMm3l47xMphYA93gA.5_oAa6jrjYL7EHHHF
 9RgnCkUPDjYuVOkWupm_2fm5ufHCYy6sAaOo.J7FZyhpQAsmKZYCU4avAnpLzhSinATV5wzSlGxm
 MRTmx7xdBgT_XuV5QzwwYtg352FyeQmBAjxEf0ghTKrAGV7Rhmn9F.hUZE7aKP44hABbztKEA2lZ
 ozUnNude8bGWNJYsPcMiKMaZmr8tlvGYGQScipeRg6Ew9IfgD6kpGb0oBaAwXM2RwysdjJ4zBWko
 Hs6PHHSyuEiVZJUhCfQsa54fAaGRZ1GmkGHhwlVrq5Amegnp6UFLqW.aYfTaHFNWb43ikX_JJq.s
 m_tn4jQTJRC1AsHAvte2QSPFau5ZadyCQBdKl9bfxpFbrWsGPD1njpzX4V...IfLclqPGxF62s5J
 _EowBW5oO3SKPNKTKaZXz8dWkllc_KkZsz2QAZEenlQRmJILfnlvBqZqOEVhuW4LqKadnFwtx9yG
 215zefSPQ3U48Vy83P_1_YY2fduoakXBK3j6CWjOf_.1SLkEMNEo0k1JkecBhZ1RrTWz8gJM087D
 aUpaWRrTi0lPSDDTr6qPDzVLRd9oCrpKGFauCrWpS0Y2nh2WZjRk64OFGYFzNzJVPJzrAueSE9lw
 luLqJc9VBv2Xz0tfjxQkbdfvLu12l7z979YAYMYkyCrdmtewWskXKveqBuXkJEHPlIecwP1jH8IO
 IrKWbAnvmwH_Ph.5xX0htyHa_qY00K2oXxLBPMOKmVRYmLKE3r7lmaYM.DL.5LqmSwSVAZ7uzuYT
 i95ELvRuUpMjXhKC.eos4VG5pOCZieLVU1Mxzyn5PVdCfs3se7FNnEgXlAXX5FXRAh90wHYre.wx
 nD1glQILTRGiwS.S6jAJnWvSs3TXsedptLKjpqDd9Cc2b6kB9D01.KEzYgpUOEru.5JvPfwmL4aB
 k2bdkzvvZuJURo689nph9UYUz2pSrYpz0NyLXBu2j.3.gxLCbgHTYPqTpxp.0XqPNWfkxfUqdGna
 W4Yd05UO9wDykIeS6RhziOdlxhRyaj8YNehGQsgn5fzX3FaHHE.4rYdPP_0qeA3qHRpGLR4CDIXr
 jJhV_yrGWrFQZzUFV1yEI3piodiwMDoEfp.JjEdjiyCSNgW2YxjIYpKlCakRQ7LUL3kJzn2VDptY
 LiV0uZCG4ejFXlUaxNCpUBdi7EjfwhWigvs6OC4dohbdn1Eu7Bjr8fPKHcZJCXDIK6g13Q77BK6O
 gRGuCWyyz6jSv9e4pOaa2cPoL2m2Bev156DmOP62j4fgUUnwmOK6lrZSGTpy5p8xhdRME6DYwqb2
 2Sj5PL6BNS32QCn7J2ysQgiyHgwI34rUz9XnREHElaxMflNAs5LJqBEOempUDxzdEO3ukxzJiBHJ
 p44Z4AyvCH1m._J5wpZDIj5fX1R2PVTDgCli2_b.ncH.UI25OWWDw4n4UrTGGpdm4N6JkkwRU1dk
 iPgFHEVj2dx32.UMDXIQvtn2k.QbPf_UgMzXB62n7.vvmh1ya8HBXD8cwSU59IAZxOVRgPhLD1lW
 p3JxsbzPL5i2fHVTRH5Gsk1AC75JGMEvOrkSeDA.Upyk5cImegCdeF0SQnv.ELh1L0laMQkc_UoE
 atbJmq3t0lOWaY9dnHWaWALPayFBJGzOZnimcFBeonMKEYcBdFA7qXzgEY0mAHZ5DUd2vw8.HXQG
 yPg.fQaBKpkrKS6ZrZ8E33_7FcD8DQOz8hP7OIqgv68jzUUp3kWhSXB2qrK7amrO2N3lo85q_PSb
 .1ja2yoytw4ISYnK7PIjRdZH9a_XTrbJZfYkaysNISzg4RnBR5q8GECi3BcsM_YaoMVLh9Ac-
X-Sonic-MF: <rac8006@aol.com>
X-Sonic-ID: f960e5ca-9e62-4ba7-ae86-70648650b8cc
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ne1.yahoo.com with HTTP; Tue, 23 Apr 2024 15:37:49 +0000
Received: by hermes--production-bf1-5cc9fc94c8-kfglr (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a7aa91dbbc13b7a750cdb14b674b3363; 
 Tue, 23 Apr 2024 15:37:45 +0000 (UTC)
To: <samba-technical@lists.samba.org>
References: <015301da9581$80865ce0$819316a0$.ref@aol.com>
 <015301da9581$80865ce0$819316a0$@aol.com>
 <20240423151917.40726f90@devstation.samdom.example.com>
 <019001da958c$4cb79270$e626b750$@aol.com>
 <20240423162021.0c58005a@devstation.samdom.example.com>
In-Reply-To: <20240423162021.0c58005a@devstation.samdom.example.com>
Subject: RE: samba shares across different os's
Date: Tue, 23 Apr 2024 11:37:44 -0400
Message-ID: <029f01da9594$30773c70$9165b550$@aol.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQICLfS/TmbevJVMnm0Pcgy/qA5NVgGHOGS6Aq0DWKkCf+34lAECcu5vsOkUQuA=
X-Antivirus: Avast (VPS 240423-2, 4/23/2024), Outbound message
X-Antivirus-Status: Clean
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
From: George via samba-technical <samba-technical@lists.samba.org>
Reply-To: rac8006@aol.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I guess the real question is how does one mount the share on different OS's
with the same user but different uid's.  If the mount get mounted owned by
root how does a user add or modify a file if he is not root.  I want the
files on the WD Device to be available to any local device in my house.  I
have a user x on the Debian Linux and windows and both laptops. The Dlink
system is going to be removed from the network.  So smb1 should not be a
problem any more.  

PS I used to be on three different lists.  I tried to stop receiving email
from three lists but was not able to stop the technical emails.  At the time
I was trying to find out why samba was writing to disk every few seconds.
Keeping the system from sleeping.  I've been retired from software
engineering for 20 years.  

-----Original Message-----
From: samba-technical <samba-technical-bounces@lists.samba.org> On Behalf Of
Rowland Penny via samba-technical
Sent: Tuesday, April 23, 2024 11:20 AM
To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: samba shares across different os's

On Tue, 23 Apr 2024 10:41:16 -0400
George via samba-technical <samba-technical@lists.samba.org> wrote:

> The Dlink system is version 1.  The WD system is smb3 after the latest 
> OS update.  The windows system has smb1 enabled.  I have had the Dlink 
> system mounted to the windows system for years and it has been working 
> fine.  Not sure how to tell what version of samba the shares are 
> mounted.

If the Dlink only uses SMBv1m then the shares on it will have to use SMBv1.

> When I mount the Dlink to the Debian system it complains and says I 
> need to use vers=1.0. But the WD system when mounted on the Debian 
> system does not complain.  The WD device is running 4.3.11.

SMBv3 support was added at 4.3.0, but there have been numerous updates and
CVE's since then, Samba latest is 4.20.0

> I'm not sure how I copied the files I think I used a cp -r  but forgot 
> to use the -a option.

If it is available, then rsync would have probably been better, but if it
isn't then 'cp -a' would have been better than 'cp -r' (see 'man cp').

> I think the fix for the all
> of the folders being empty was doing a chown -r user *  This seemed to 
> allow most folders to display there contents.

If that worked, then the files had probably been transferred, but then
belonged to another user/group and you were not allowed to see them.

> When I mount the
> WD on the Debian system the owner/group is always root:root.  

That is fairly standard for a mount.

> I'm using the WD because it has been sitting around not used for a few 
> years.  I'm not real happy with it because they use a non standard 64k 
> pagesize.  Which means you have to compile your own programs that ware 
> not on the device rather than just apt install.
> I just thought that I could remove the Dlink and use the WD.  It is a 
> low power device that can be left on all the time.  Which allows me to 
> access the files from any of my pcs's or laptops or phone or TV's.

If it works for you, then great, but it is still an elderly device and if I
were you, I would be looking on it as a 'stop gap' until I could replace it
with something newer, but it is totally your decision.

> 
> Sorry for posting on this forum.  It is the only one I get email from.

Not a problem really, but the thing is, samba-technical is meant for
discussing the 'internals' of Samba, problems like yours are best discussed
on the samba mailing list, so it might be an idea to register for that next
time ;-)

Rowland




