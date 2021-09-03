Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F53FF8B0
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 03:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2H9pmBYNDpedhSLc4OTC9hYxltWv0HIVlChy09Mo7oM=; b=Tbg+RWDmgk6lmIYQDT8S6rj5tD
	Q0Mo2+ytjfR4QBFQggD4ha0j31ooeULQ6ozF5yA4ySbJcayw+HoBUmmcNMhcZsZesNXgNrcg2+XXk
	arT2FDet9/jU8Uz2Fr8HixohDtcqW/qOlVrPbIZL6EFTcvtNXbO7Pm4ZFPZeh0wwImczDZlAtMMab
	/GMyRweWydrx/+SnbzPLC8Qvp1JfH/mMUQxwYAwYDh1qvPE8K8hQNwzulWbw6Y0stlwCYTJ4vlzTD
	tX5a8VG3zUv0BAPM3ngBgsGNaTcP+Z0Ejm3tqOwMmyg8JRwZSRS3L7KEQELJoYv1TMTKZBlPmFI+K
	skCNZZ4A==;
Received: from ip6-localhost ([::1]:59520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLyHs-00CsRm-5T; Fri, 03 Sep 2021 01:46:36 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36353) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLyHl-00CsRd-Cw
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 01:46:32 +0000
Received: by mail-qk1-x736.google.com with SMTP id p4so4365131qki.3
 for <samba-technical@lists.samba.org>; Thu, 02 Sep 2021 18:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=f8zUeB9jsjgJVf5Ai8RSpaY+cVg3CnVvL3Wnfp6KpGw=;
 b=tjOhefP8Ww3ubS4QcNRxB3DpIgtWfk4315IEhzJnS7U5tGCYo94yFrmM7MN3t0yi2w
 Xoz1D44UMLu0JsA33vrPYsghYfxFSiag4/ISkTCNGatSFZmFTERDxHwnCAbPNQJo5Bwz
 bv+r2t1DKVsx0L6zZusf/ZX0euKHERZW6ud/8cC9UCi7SvgTGlljFf5C/87SkrY6vZPw
 9uF2fuRHbf4uYPtyg0DwiSAcfF1lGQQ3HUxJeuXvJ0hjrtm2dtQ8lKmFH3jRkA3xTHhQ
 MBpc9WLyl7sTjwct4SxZSkOUoEsS+yx/dmTh1h9FnVDI0xR76f9B/s9tphH3QugtgYkw
 Jc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=f8zUeB9jsjgJVf5Ai8RSpaY+cVg3CnVvL3Wnfp6KpGw=;
 b=ZmGkRR+wl86YjOUBZ+kPoy372vAyZJJJAZTQVMsRdbl1xir1IFpLeWcNMlQecpf1zn
 21xyQUkz15nw5uQxLRRnfZsWbfBcCfGeQW1UQ/EVPancr7w9awfnOK29RoXW0Q3Pw1F+
 ux/aJTy52WsTDcsAIqt8At/Sr1IqVdARWKTAJzWBcinFA83EvXcZCm2rbE0RiYEMPUVA
 cWjfxexTjooObBXOEM8+DSX5ymxbSg2spwTR9QcKxrO307rx7zC8HJ0sY9zUJTXzHigs
 fBXTbb/0a6XGl0exX0SVFAF0QhOcDqHjK4oBVOUPH2PKBHDSGanM9mJdQgRc/YiFlOaY
 vMFQ==
X-Gm-Message-State: AOAM5338kzzPJhmuO/iLh32jyWDlQNfPWNXIIutGVX0vJvU09cnooH6T
 RaxaFpyi2NhwjEU5wG8h85wufmPSVjvtKdk3EqafqfLoTsCT8Q==
X-Google-Smtp-Source: ABdhPJxOmACyfWhHhFYuh6nbQNJHq2SbadKKeZ/W3uzcX8gga09QZSe/M3JCPkO8f1C+dHaNMyhgyE5uuoj0tuDw+tA=
X-Received: by 2002:a37:a80c:: with SMTP id r12mr1103038qke.299.1630633587345; 
 Thu, 02 Sep 2021 18:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHA-KoNeLd2bUCgU+4nNy=nMFWKUgOYxHrpdEZZsX3M3m523mA@mail.gmail.com>
In-Reply-To: <CAHA-KoNeLd2bUCgU+4nNy=nMFWKUgOYxHrpdEZZsX3M3m523mA@mail.gmail.com>
Date: Fri, 3 Sep 2021 13:46:16 +1200
Message-ID: <CAHA-KoM+Js20vVKOxVMTC7LAA_C0Bw9n2H-tpYB_KYLR64-smA@mail.gmail.com>
Subject: Fwd: SAMB_INTERNAL DNS forwarding port merge request - my initial
 samba submission
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Could a current maintainer check this over please.

Regards,

Matt

---------- Forwarded message ---------
From: Matt Grant <matt@mattgrant.net.nz>
Date: Fri, 3 Sept 2021 at 13:45
Subject: SAMB_INTERNAL DNS forwarding port merge request - my initial samba
submission
To: Andrew Bartlett <abartlet@samba.org>


Hi Andrew!

Bug number https://bugzilla.samba.org/show_bug.cgi?id=13355, assigned
to Kai Blin, 2 years ago and never closed.

Could you please review my patch. Merge Request:

https://gitlab.com/samba-team/samba/-/merge_requests/2146

NOTE: In the dns_forwarder helpers, there is a rather nasty feature in
Python standard library SocketServer code exposed.  You have to subclass
UDPServer to get it to do IPv6....  Checked module documentation in Python
3.9, read source code, and this is the only way to fix this ;-(

Also, testparm does not have any parsing support for the smb.conf dns
forwarder entry as it is specified as a cmd_list....  testparm will take
just anything there and accept it.  Lots of other places where IP numbers
are given and no sanity checking done either, so chose to leave well alone,
as that looks like the subject of another improvement project.

Please let me know of any improvements, especially working around the above
nasty.  Given, its in the Samba test suite, so its probably not too serious.

Thank you so much!

Regards,

Matt Grant
