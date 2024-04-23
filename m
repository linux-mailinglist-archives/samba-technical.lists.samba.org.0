Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4CA8AE9B3
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 16:41:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=S/AyBYAN+LKhCXDrSgfn5wvYJkcRS8kArkcyxyp0lcY=; b=IXmZi6RPnizvJUw5OGRmzXScUD
	uNuiO4b2xk9v5j0FkN4r9+oVtc+/ASlTPxdzX7EjFlMXemxJwX1LD+mXzdTT76ugL6Ze7JmsxIj23
	vJvYJ+itNpe86qO0Da7v/gZitH1gJvO1GMQBBy2jZwCNMvWe5LgmH4pwzlozRYKC8hQoQos72Pe/4
	/NtGyaI04RviKIgN9SS7dONvcgoYsH3DWmlsfTvsKUEu8O3kd6ardlLkZy1FOPxlHVbYsx+XvX1qd
	CzAX2u6/VDIeVnUuQDuxB10vu3lp4/H564UL7xb2nTuut360H0XORcKWRMVCZLmG7gj5s5PgAAarB
	PCINtBKg==;
Received: from ip6-localhost ([::1]:63652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzHKq-005SR0-I1; Tue, 23 Apr 2024 14:41:28 +0000
Received: from sonic307-9.consmr.mail.ne1.yahoo.com ([66.163.190.32]:41301) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rzHKm-005SQs-I4
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 14:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1713883278; bh=S/AyBYAN+LKhCXDrSgfn5wvYJkcRS8kArkcyxyp0lcY=;
 h=From:To:References:In-Reply-To:Subject:Date:From:Subject:Reply-To;
 b=JztgK4ggWU13dlxe7sQuEU1lo+d29Sh6SIVbOW3sx2VvrPDSo7IwwF3GtnoiFEgjuFS8mlLwGCEt8kWodugsvuOwoNlq9i+/J49OXLGMh14fYRnHojeQ7QnmD0aYUpRTSR5hrE6WfroRxqR8dSV9MLtXXxdFPpXhEm0jBqT18vCFgqCjebhIA/wAv6tVW4Z/Dz3Cp/emySWRaiwP6zhwO13C33N23tkuZMakjgl/mIGG0y+ma4gpt5Gh4q91HQK3cycQfYR6DvuZpxRVcsxkvdJps2Byl+Nea+XQhz1Cs8tEJH1m/S7+bj8n40VJEjVmWKdmnlpMlN/FvhiJhJe4Gg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713883278; bh=gAgxQ8dcw8eNmianWHiZGk/s3kTmoWhgwMp7pRMQHXY=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=qsSaczJSSXDEstfg6muArJOg+DVzREdQVMAfldye8SyCu5gpYfHHGxbScqXMt4FciCfADF+9LJOb/Vi7rmglN6sHZk+LAQ4lXzuntOfB6HHLcZAlJoTYyfGbDedeie52EI0BdQ6cErgTWb2Z0/jhdSZKtcHtLCEeuyIAjXtSDfGYIGn8w9oRW/ZsV+v2dHYwydpT+EI0M6YVDKQYqjds55cx5YLRfyrj7HziAI2K9ndwv5riUFWbKHeoDdFWSXVsibNFH1dTj3E+lzsRpfBCPGTgeEEc0bdUxH1g33TcbZ7/2C4C5BYc7z2lL6+0rcV0M6dmB9vTez1XSCTKHN0X2A==
X-YMail-OSG: kE6DAbUVM1lJ6OcNQBJRqm7PZ_.fZzUU0t93b.vWCBcgsBhT8hzCZiAmutzIn_O
 N8aLVb7H7Le_A9dVwF7XNRXYoSu2eEYn6hh1tbN0brwIzHkPKqsvMmXJnZwfAj82ic.tZB2V_pSv
 3ujaa6zIdTffG8QkMcBJOuVlNdZpggR72WdA0dOc92TeKuniHr1vMetMSSqrLtgBFsDwpPT6.k7f
 IDEZv7MyipEqnTbkrfPbX_M7IYm7qoJEdDRQczq4ueqpLS.sqDAYuSXNKTBT3nDDyu3Pp2WA_pPk
 JZUUi2NDdvHyhO2eqsmsbhVhG4eOxf4BcwfFSMKWvdnR2_wY2eCuudzTRZ2AI7tnzOOQCR.UeDOQ
 pc8K9S_xrZ_TmcoMP_qsfGoTzYm3HDM_VY8Km5yt9famFsW1YzmoncJVFSJy51Xn5BzIMBE2qLBk
 2Mg5wclwSIRs9v9qOv0_PGJw17xqdy.20_rk2R25vgOKDOgJboD33r5pNY1RdrS.utrEnNXYV_FX
 jk4W.D866UPERxIXCR5aw6dfYl0x2PGWIGM0QP9JywFt3LhIqLd6bkAlzzXgdt9OtrumcUJamWb4
 H6qehPdTo9Fthdb77n9nQ_VPh9eToXDo2ZpYfgn81GqqGZo9qvXiFtFRuaf4SsVEl40jGzeTAPYA
 ZqY0HXsIXn.2akGabE8rQ8e7b4HrXZDNfDARlBaYmzZbwFX9HN6ceJOR1xQtj3YIlhl7uBHBRMtX
 MZ8FpoT90UrB.ybUCzpfqIXpH2ZHBh1jYMpIONyaW3wwa9gy7gnKNkZCXJTbu4Y14mvIskSxf7i7
 Xa3vdemea_GpKcPUBgVlokB9lXGxiSNwIs_O.94uwBH1Bv3iT96YnglwuhQ6yipbSCsi___uZxWP
 ey3UP69euznP9BcoO4hGk5vuGgx_2T1phthd425Em.7FbyQ07CWEKBcoI.kh1JLZe8lZOCdNrjXu
 wTphQvqAWiWlwhjZrxwCHeE6GmrIFJNm_HLDydZ_sg4vu7ljJ.PSJVDPKDeTG3H4Zpgq7DNCLAZk
 mXopNxe4TdgKOoo0DL1KHyF28aax9zZAGUBZFZ98M.FOK8L7wWbCzxYlBgoVvYmubm.z8WdE5rhg
 9XO6bcVHoG3bQNfgoWVgqfEr8LsHUcW5.rickEIg1BrPBRuEZm5cLtqRSR4qwczNpMRHt2sKEdlH
 Kkf.kiXDPl9VmjC.orqArV6.IcKzDSmuw.U5Ra3xwAy3LJvE1mF_lsbWkiQlcRFecysEG43GNyf9
 NLUVSuAgGyxMcSjB_oDaLMAEyDphFpChpceGimyVXm31xjF3p7dSG6p3mbUwOOs66eQdqIIhSrbZ
 ZCJ9WbWR04kmKclc3tFUqTEC4BGul4hDfSe6tB7OGCcbNIgxtCdGrpWpQJkU.nHUlgBZOoGzpnHz
 aub4ptZuwubliQ_znkAvcFdwgnaRKY1_ttJVErACvzEwJnT6kmttgEOLb7mjKYL_pMUMCXtLPEj9
 SJ1OVguTJNuXee_0kKZ2SNqqxyJpoR.Er4Xxy.gRvPF9oztsbLr8al3e6ODDz6iTqMnUfXcQKUFX
 _v.0UU8zD1MTPsgQHmCn9yzilPfEN1xKNmkcqQ6h7h28GbA_tKRLTQOffZWBZ4l0F9IxxZkCH3jV
 JOLx4.k6i9HdWf_CF0ezBCn1l8cY8Gg38bTtrptIrnU2cPUPxSjEx55igkkqqzDwJOSWPCVkoTNM
 csl6u3HNpABXH9XshoEkwYFO8zr0boFEl.mK77jyXloera6XStG4Zp6IHJlkhIlRFLFNZ00dvu6S
 OloAl8Y.hItZLA2QITav4wpIkuhKtqNgAafGB4jmkELUadgSJQy9sjKDolbtcK3Iq5hlBu5GlUAE
 _ykFKeEH7U08p_8zBeRmndVlpAOz6sJ66.3EobCsmk9C1wvbrxyBRSVpCUiKwTXb6hER5V5eL4.v
 T4MLTokbQmspcLFDKD7.L8S7C5KM2ah6Olcg.4WbsHZNAUyDRG9Ov_v6u1aiKtoEXjJwmdjwikzz
 CSpTJmsGruaw1h8UXoSGPmAZkq1Xl3AF1zlxHFwhnyP.NbSvG8NjdpHmiifWZ42Di8s1LSLngSND
 jJN2COmvZkmpA.gzZzn._pu2Ju9EDl0XTQF2T688R7YIdkMbwmLL0vyp1EeqHcV5CipTHiUqnhUA
 AdvABYYZ1Uv5d.GqF_9cW6d4Q92YNEU76.xkcYc9mRKOKuMsV1vBvKSd.AAVE_.uf5Gw_nErE
X-Sonic-MF: <rac8006@aol.com>
X-Sonic-ID: 27075fdf-e8b6-41c4-a99a-88d7c0d9386e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Tue, 23 Apr 2024 14:41:18 +0000
Received: by hermes--production-bf1-5cc9fc94c8-vp97g (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e9147b6da47e7174c002304086cc76e9; 
 Tue, 23 Apr 2024 14:41:16 +0000 (UTC)
To: <samba-technical@lists.samba.org>
References: <015301da9581$80865ce0$819316a0$.ref@aol.com>
 <015301da9581$80865ce0$819316a0$@aol.com>
 <20240423151917.40726f90@devstation.samdom.example.com>
In-Reply-To: <20240423151917.40726f90@devstation.samdom.example.com>
Subject: RE: samba shares across different os's
Date: Tue, 23 Apr 2024 10:41:16 -0400
Message-ID: <019001da958c$4cb79270$e626b750$@aol.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQICLfS/TmbevJVMnm0Pcgy/qA5NVgGHOGS6Aq0DWKmxBRVpUA==
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

The Dlink system is version 1.  The WD system is smb3 after the latest OS
update.  The windows system has smb1 enabled.  I have had the Dlink system
mounted to the windows system for years and it has  been working fine.  Not
sure how to tell what version of samba the shares are mounted.  When I mount
the Dlink to the Debian system it complains and says I need to use vers=1.0.
But the WD system when mounted on the Debian system does not complain.  The
WD device is running 4.3.11.
I'm not sure how I copied the files I think I used a cp -r  but forgot to
use the -a option.  I think the fix for the all of the folders being empty
was doing a chown -r user *  This seemed to allow most folders to display
there contents.  When I mount the WD on the Debian system the owner/group is
always root:root.  
I'm using the WD because it has been sitting around not used for a few
years.  I'm not real happy with it because they use a non standard 64k
pagesize.  Which means you have to compile your own programs that ware not
on the device rather than just apt install.
I just thought that I could remove the Dlink and use the WD.  It is a low
power device that can be left on all the time.  Which allows me to access
the files from any of my pcs's or laptops or phone or TV's.

Sorry for posting on this forum.  It is the only one I get email from.
-----
Original Message-----
From: samba-technical <samba-technical-bounces@lists.samba.org> On Behalf Of
Rowland Penny via samba-technical
Sent: Tuesday, April 23, 2024 10:19 AM
To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: samba shares across different os's

On Tue, 23 Apr 2024 09:23:58 -0400
George via samba-technical <samba-technical@lists.samba.org> wrote:

> It has been a while since I've posted to this forum.  I hope I'm 
> posting to the correct forum.

Sorry, but you really should have posted to the samba mailing list, but you
are here now.

> Here is my problem.
> 
> I have a DLink DNS323 which uses smb1. This device is currently mapped 
> as T: and U; on my windows 10 Pro pc and laptop. I also have a WD My 
> Cloud gen1 single disk using smb3 I think.

You sure about that, from my understanding, the OS on that thing is based on
Debian Wheezy and that OS came with Samba 3.6.x and hence no
SMBv3

> I also have a PC
> running Debian Linux 12.5. I want to copy all of the files from the 
> DLink device to the WD device.

I wouldn't, I think you are jumping out of the frying pan into the fire,
both the Dlink and WD device are both elderly, you would probably (if you
can afforrd it) be better off getting a new device.

> After copying all of the files. I
> unmapped the T: and U; shares of the DLink device and mapped T: and
> U: from the WD device. After the mapping I checked some of the folders 
> and found that only the top level files and folders were visible. 
> Every folder was empty. After a log of fiddling I got most of the 
> folders to show files. Not sure what I finally did to get this almost 
> working. So I tried to mount the WD device to the Linux PC and got the 
> same problem of the folders being empty. My question is what do I need 
> to do the be able to mount the WD device on the windows PC and the 
> Linux PC with all files available. I want to use the Linux PC as 
> backup for the WD device and use the WD device as backup for some 
> files from the Linux PC.
> 

How did you copy the files ?
Have you checked that your Win10 machines have SMBv1 turned on.

Rowland
 




