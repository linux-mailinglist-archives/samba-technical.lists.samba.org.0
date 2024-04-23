Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D88AE806
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 15:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=oAxzruz0BsfOXfVShjJdpTlGj49o4uuCMvE8s3MdElo=; b=h7q0XgmHyxs51SAkiUS1EKZ+HS
	jLxNP9HNY+ZqQQ60Eow4NgW0juUWjbGErnj6fCAMylzC0khvslxDPqChhOEGNR/EJFfGQKRlrIO0c
	zXa6W/fAKiIxdBvaZoAzUNPhhi+v1OrS5HFZESsjAJHvQPWA+t0o/0l2jchGhJEe8mx2ITafVZlwY
	xkRS2Iq+Pd5LgNEt9xBpfzVIHqiXMNwxsoxMUqgj0WWau57fJNjXdvBXVFXZt+hvVTLdJfrHKQU3/
	R0StkUbWylgbA+dmlqLg6xwerFc1wuG90MCcCAFk4s1R7sSbF77ZFG2t05R6qB3Fvvuf6fl8riprR
	6T1/1xyg==;
Received: from ip6-localhost ([::1]:37286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzG85-005S4m-7R; Tue, 23 Apr 2024 13:24:13 +0000
Received: from sonic309-20.consmr.mail.ne1.yahoo.com ([66.163.184.146]:46596) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rzG81-005S4e-Ej
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 13:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1713878644; bh=oGMTyNC+i19/DJ+jBeFUz0PPupPz24sdq+wVvd/Y1LY=;
 h=From:To:Subject:Date:References:From:Subject:Reply-To;
 b=TtqpMRUKUQkIRkg9jAOj08EwoZVySJ4I8x9jCOGLiK491OkE/Nvlkb3qlxWx2pQakrjlTMe7rIDpYERljTmvNmjiyYuxVYwTpLhuv6wFZ8mllI40Ww8N6ckINjqCG/TF07I6gJVVl7DxOvVFKqCMScLcqXY0WrxmR+g4URX0YHH+tONrvLEI62UjXuYZwsfpMycUwjHybSt6tDwuHnK7JHca+8sTJnMu4RIBLJkv0Ungl8sJBz+x5IiU0JhmH4/F/1taY9O+OfbwcNCF5golkkSY0LXjYs+hQWyEKj8Q3sRlk7ywUBEqmSXGDA6pa8hR7pjfKX9tJj3RmouaRa+rbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713878644; bh=L7PACiXi9YTKXKLFh3o86I1J4pRPoHghfn+hFTrwwq1=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=J11xi0PmNBohIHy0451zn1Q54Sk8UXMf6Z7Zn/QVcD5kTH2ad0Sg8umIH8eNXtwzXxOtrubAI+YZESwc1mXU/EXC8F3eHkq/nrUFCoJhCTXu5xGcDmM0LDAWTuZU1XqOSD0/WdDKl8H2hJTjtYjh4alSBhLA6MyeIJVrsSnE1ooqhYana1SiOCH4YRTabUP6Q2AVBeZYXvcVs0WCesFPDzrqQoG2HICYvCownyvGsIuqgplSKC0UFYAhpHmPPXK86InEFl0tU2HCiJJIXpbZnH0uICck2Vets3or02cV+msCGSwGMbt5m4lHWZjfpTdAFsMD4HrNoRM/EM145BZ9YA==
X-YMail-OSG: U0kx.N0VM1mqpysA6vdrpvkg6si8vsSWl9zqdQlTA6YABsR5AIzdhSqkoDyvPty
 AZFqE4s.0HQAFBU9jONOOSU_cG7FwQUxvtzUZMbYxfx4jBXBn_n6AiB52DmJcb5K2YVI127Xwx2L
 nApmBYfmZGZn.AkoT2XQyJ6FCKgOD.r.FcC37RdmKyyX8WFmT7Ydz5iFx8O_hkYVCQrsF6fiW7N7
 o5ng5Ftu7ueQniQcVjtzRPU2_CSsyBZDqkeylv6zQimn4t6oqjahyOPaZtl8XA0AOT8gtH5z3fm2
 JbKdrxXW.BQVRARIHskMTqXvHnyGk2DOCb58Y0oDKvrJ0k5hqi2mhl1JLklax3SqKj0QHCzyaQ0r
 MbHIGeZa4qsU8G0CLwFSS_GCp0uiN9K7eG4BdkbQ_Y_.OVhfv2fP1ooDixylC_A6xBAGb6JViPIX
 nAANP5IfK62eKabUK.siPooRDCEomIOqvbCbf0xKkAnuN94DOh9ko5zyD1bMyAUk.ndUyLDBXC9a
 Afk7GQwboHt1lgVw8m_INaFrocsc9F5nBMeJpVHgiT_Ya1kyWlhtNyriiNmEXnUxE6TcZxvXwAiS
 0wiCUqL4csBFrmHf7Y5S9EWiT4e3h.qS0SGlFJMIqIA4B5u3UewXUWBVdaY5vHj8JeoCctI1NuEd
 uYkzBI_9vLCf.Yjpo_tdwGj4RSTDM0LKlK41yL0Bva3R3DQHDjRL1xsStZ7TwzBl6TIi49PGWI8a
 99i02UdQAUl7HD.VLzM89G4oL3hSpPY6mRGzJ7YmhwO8gNvlraqPaX4WSrqMIYisauObnZIgFRq8
 mml2sx8uXVGz.pzemg.44BFNjbGhWU0VoM2kUC81q7sYilcH_rNHO9pTHtvE7jbL.p2ot8Qh9CAY
 q8J2QT4cUKE3vHYuBbueY86FP1upK6SulCRufcDFfA_G8fPLf.ZAlZbao71EwhlFhPuY8i6I5s1n
 Tnrz1cM5pg9pLAKVI00P4kZhCDDAnzk0gBDSkuVG8InK8Vkryz5IiipD0UlkOmBZQxvwAhhifsV9
 1RjCsO1Wh3waahruLdv9Zmk7pb4EjUBcsR.uNPtWbqgZs0UVnRwG.PovjodmxVZK66gCt_hZYPCN
 xOBgDjfX1ifeB0RYBVPY2OosN6Sy32zuU1xIluBxEdrVQFEopNztdu_JMAacmtjwtDUHFcwQml4t
 O976r6zgw5bljxfR1t9dvz7ZxBRB5Bpa1ZrJDwNWXeOYKzdbwEVbQv_9HeP3qutbT9o0zqt9uFii
 A_QWCsnwNaNSlwSMN_7yOIvUoU5pj.zIW47i.GT7whRvyhVOMlv6jSjrLnNE0MxnTXckCFi7tGJY
 hr1AJWA8NGAsrJ06y7RqNONygTf3wl1jg26h0q.gb56kSSsWJaVeNJHz4IOBhkoSKAalsQIAwPIg
 zY1Pe0xWKtlbAPlQ3CRsXW0r77UYBqpMXRol4zYRrGTP9P2EED_6UqRzJ3J_.NdqZwNJiQrnd.6V
 xL2Q4okjhMUauh5vTrlJB9VJJW3qrHl5Ov4z2Pq1POCrbEMbvZvLqkh54kXcdUloeETUHgKJ7TwA
 SkbzErNbWyTv3zEQV9Dr5RKNhX7TAOqv8olFdmM4FnaBHZARBIzCY6Y2HmHh8Rh1yuijziLZkYFd
 RKf8JgeEc6p5mvurjXyFwXLIey2NcZTXOxecnHqaqA.13S6iwc3mk8GhJ6bUJ97DFDAyifGDY72L
 Zcm9s9bExnV2wj4OIpS11RA4P8WleY6vifiU14EqtOUkmpVAQAK4yvhx43nHZ2mbAlq7jb8jACte
 yeb46iZ0aTlkRhhr9BrP._LCtkHsa0eHcPEi.5NzusDJMgZPmQkvtAR.PzJ6b.uuzzEB38pyMDxB
 sJrukhVHStmrAA9cZwaZ3DvvVGl8NBrBTSxUnaV99PbzaH6DKKsQWS3N_U1eDN0t1ObluYeSbqhe
 uYF4Mmmnv2oTPlu3v1NINyZQ2AZAyo2NqghKDsoFBL1djiz7eZp7SFz2P7O7ONjooM0iK8MIs7tY
 HcR70mmSXS5B22kxKwC2IR_EGormU64pfqdV8YPRcuM0UKHi9A0yiF8lqF5tMRTgKxoNoQ4_RqQx
 vHxAM.OfSSI6YFEUwo0RnzAKE_W2fNy1ZfBMX_HOcKbf198BDHF8n6oKIUdNpmsurp..3YJqmdDY
 FcC_T9w0zzX_VKbis6vbA6OaEDD4BOwA2mwepnku1.6sxXNYw2cJ6Gp_lJle90dIKabYWHLLIpt1
 MtoTbbk_EafUwZCBOV0tZ7O4-
X-Sonic-MF: <rac8006@aol.com>
X-Sonic-ID: d236c062-644a-4629-b6bd-f00be8a36700
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 23 Apr 2024 13:24:04 +0000
Received: by hermes--production-bf1-5cc9fc94c8-xqcg6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b94a022685cdece94c55b48dc2991606; 
 Tue, 23 Apr 2024 13:23:59 +0000 (UTC)
To: <samba-technical@lists.samba.org>
Subject: samba shares across different os's
Date: Tue, 23 Apr 2024 09:23:58 -0400
Message-ID: <015301da9581$80865ce0$819316a0$@aol.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdqVgT9Q8bzJmvvORYauMsmwUF6+ZQ==
X-Antivirus: Avast (VPS 240423-2, 4/23/2024), Outbound message
X-Antivirus-Status: Clean
References: <015301da9581$80865ce0$819316a0$.ref@aol.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

It has been a while since I've posted to this forum.  I hope I'm posting to
the correct forum.  Here is my problem.

I have a DLink DNS323 which uses smb1. This device is currently mapped as T:
and U; on my windows 10 Pro pc and laptop. I also have a WD My Cloud gen1
single disk using smb3 I think. I also have a PC running Debian Linux 12.5.
I want to copy all of the files from the DLink device to the WD device.
After copying all of the files. I unmapped the T: and U; shares of the DLink
device and mapped T: and U: from the WD device. After the mapping I checked
some of the folders and found that only the top level files and folders were
visible. Every folder was empty. After a log of fiddling I got most of the
folders to show files. Not sure what I finally did to get this almost
working. So I tried to mount the WD device to the Linux PC and got the same
problem of the folders being empty. 
My question is what do I need to do the be able to mount the WD device on
the windows PC and the Linux PC with all files available. I want to use the
Linux PC as backup for the WD device and use the WD device as backup for
some files from the Linux PC.

