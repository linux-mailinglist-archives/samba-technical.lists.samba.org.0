Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD831B3CF
	for <lists+samba-technical@lfdr.de>; Mon, 15 Feb 2021 02:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SfYFblpSib/Vr1j+2XMm6Ietkk5NSHooqY/HQ7G8Seg=; b=AU5zaNP7mn/MNl3KRjGCjeW9Ti
	B5B4sSa0nbCs/fn81G/MM3JI3WmwTiHfz5xIuS8JPNc6qG1YbKAIsgH8tGpxkms9gSI/KWCG50ias
	rur1T/Fb5PvgggUGnfGhcdevpDJgJHFPDg69sol3PB74qSuLyJsRg2xu9HiGy+CmWWk4rEj7bTkd/
	VuYCGKWEL+fNbo++876xmzKgk1tkmCrN+tfr/ttF/JbDhpLupHhpkRvipcC8HsYjrMpYykC3QtF3q
	eBYs9EELcasRNEvtPaHj0dZh36iRYho/Fi6qPruJ+pCYWOTcQS7gF4uH6jWGl010U2lYjUeXLeFRp
	t0ytLDwA==;
Received: from ip6-localhost ([::1]:47118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lBSEw-00CdPe-2b; Mon, 15 Feb 2021 00:59:50 +0000
Received: from mailout3.samsung.com ([203.254.224.33]:50875) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lBSEn-00CdPX-5p
 for samba-technical@lists.samba.org; Mon, 15 Feb 2021 00:59:46 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210215005931epoutp03d5df71c5bca6e33eeaa1b152e95d6486~jxfqGyQxB2773827738epoutp03Z
 for <samba-technical@lists.samba.org>; Mon, 15 Feb 2021 00:59:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210215005931epoutp03d5df71c5bca6e33eeaa1b152e95d6486~jxfqGyQxB2773827738epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1613350771;
 bh=SfYFblpSib/Vr1j+2XMm6Ietkk5NSHooqY/HQ7G8Seg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=qjRJ6JvYwv4kyFTLcgTY54xwRqTZVKtiy0S0FmkTXhwmmKyUpaSHMaCuPtIA/V8PI
 3e/m3IiCuXE501L+XsVLruYPmhTxE/T85QiywB3ZeFZagorxjUm/KT9DcWlpxdUoe/
 QZc7MzKUYXoieXnYuw3GxstWBX03owzfqABywJc0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210215005930epcas1p435d4e6cbf44db980cfdde7571e36cb95~jxfpmMTOW0985009850epcas1p4L;
 Mon, 15 Feb 2021 00:59:30 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.160]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Df5NK6Pt3z4x9QF; Mon, 15 Feb
 2021 00:59:29 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.EF.02418.177C9206; Mon, 15 Feb 2021 09:59:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210215005929epcas1p49aacc3d06efa8e70eb99c745d15fa839~jxfoD3GLQ2852528525epcas1p4h;
 Mon, 15 Feb 2021 00:59:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210215005929epsmtrp1403ed34dc7aa307dc04c0ed1b2b6dbb2~jxfoDMw4y0077500775epsmtrp1G;
 Mon, 15 Feb 2021 00:59:29 +0000 (GMT)
X-AuditID: b6c32a35-c0dff70000010972-b0-6029c771b154
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.11.13470.077C9206; Mon, 15 Feb 2021 09:59:29 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210215005928epsmtip1c6861c2e6ea205f3c2dccb3ed76e5ce6~jxfn324LX1862218622epsmtip18;
 Mon, 15 Feb 2021 00:59:28 +0000 (GMT)
To: "'Stefan Metzmacher'" <metze@samba.org>
In-Reply-To: <adf41e69-5915-06aa-6f8b-8ffc073fc8a7@samba.org>
Subject: RE: ksmbd ABI for ksmbd-tools...
Date: Mon, 15 Feb 2021 09:59:29 +0900
Message-ID: <009101d70335$d02bcb40$708361c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLNkXaegPBuGsSfX03ExGj/IX/q7QD54CbSqGNkVFA=
Content-Language: ko
X-CMS-MailID: 20210215005929epcas1p49aacc3d06efa8e70eb99c745d15fa839
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210212143813epcas1p1dcbff2491a1c7cf052c03e57f54e1474
References: <CGME20210212143813epcas1p1dcbff2491a1c7cf052c03e57f54e1474@epcas1p1.samsung.com>
 <adf41e69-5915-06aa-6f8b-8ffc073fc8a7@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: linux-cifs@vger.kernel.org,
 'Samba	Technical' <samba-technical@lists.samba.org>,
 'Namjae Jeon' <linkinjeon@kernel.org>, linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Hi Namjae,
Hi Metze,
> 
> I looked through the interfaces used between userspace (ksmbd.mountd and ksmbd.control) and the kernel
> module.
> 
> After loading the ksmbd.ko module and calling 'ksmbd.mountd', I see the following related
> proceses/kernel-threads:
> 
>   12200 ?        I      0:00 [kworker/0:0-ksmbd-io]
>   12247 ?        Ss     0:00 ksmbd.mountd
>   12248 ?        S      0:00 ksmbd.mountd
>   12249 ?        S      0:00 [ksmbd-lo]
>   12250 ?        S      0:00 [ksmbd-enp0s3]
>   12251 ?        S      0:00 [ksmbd-enp0s8]
>   12252 ?        S      0:00 [ksmbd-enp0s9]
>   12253 ?        S      0:00 [ksmbd-enp0s10]
>   12254 ?        I<     0:00 [ksmbd-smb_direc]
>   12255 ?        S      0:00 [ksmbd:38794]
>   12257 ?        S      0:00 [ksmbd:51579]
> 
> I haven't found the exact place, but ksmbd.mountd starts the kernel-part.
> 
> ksmbd.mountd also acts as some kind of upcall, for the server part, that takes care of authentication
> and some basic DCERPC calls.
> 
> I'm wondering why there are two separate ways to kill the running server, 'killall ksmbd.mountd' for
> the userspace part and 'ksmbd.control -s' (which is just a wrapper for 'echo -n "hard" >
> /sys/class/ksmbd-control/kill_server') to shutdown the server part.
Hm.. We can add the code that kill ksmbd.mountd in ksmbd.control -s.
> 
> As it's not useful to run any of these two components on its own, so I'm wondering why there's no
> stronger relationship.
Sergey answered.
> 
> As naive admin I'd assume that the kernel part would detect the exit of ksmbd.mountd and shutdown
> itself.
Sergey answered.
> 
> It would also be great to bind to specific ip addresses instead of devices and allow to run more than
> one instance of ksmbd.mountd (with different config files and or within containers). That's why I
> think single global hardcoded path like '/sys/class/ksmbd-control/kill_server' should be avoided,
> something like:
> '/sys/class/ksmbd-control/<pid-of-ksmbd.mountd>/kill_server' would be better (if it's needed at all).
Could you please elaborate more why we should do this ?

> 
> I also have ideas how ksmbd{.ok,.mountd} could make use of Samba's winbindd (or authentication) and
> Samba's rpc services, but this would require a few changes in the netlink protocol between ksmbd.ko
> and ksmbd.mountd. It would be great if a Samba smb.conf option could cause smbd to start ksmbd.mountd
> in the background and delegate all raw SMB handling to the kernel.
It's what I plan to do in the long run. It would be great for ksmbd to fully support the function
using samba's library. But I don't think ksmbd should have dependency on such samba's libraries.
i.e. If we change the existing netlink protocol in ksmbd to use samba's winbindd and librpc,
The current users using ksmbd on closed systems may not be able to use ksmbd due to GPLv3. So, This
should be a new netlink protocol addition or extension, not change the existing ones.

> 
> So my main big question is how stable would the userspace interface to ksmbd.ko be treated?
Sergey answered. If his answer is not enough, Let me know it.
> 
> Would it be possible to change the netlink protocol or /sys/class/* behavior in future in order to
> improve things?
Yes.
> 
> Can we require that the userspace tool matches the kernel version for a while?
Sergey answered. If there is a better way than now, please give me your opinion.
> 
> I think iproute2 creates a version for each stable kernel tree and tools like bpftool, perf even come
> with each single kernel release.
Ah. Even if there is no change in source, Does it release according to the kernel version?
It would be better that ksmbd-tools also is merged into kernel/tools like bfptool or perf,
but I am not sure if it is possible. nfs-utils seems to be managed well apart from the kernel version.
> 
Thanks!


