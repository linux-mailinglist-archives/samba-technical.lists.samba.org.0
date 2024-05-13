Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68F8C436A
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2024 16:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xvXK/F0LflGATfnEUUyWB1Jr4RJL8TIUbecbk0NqTkM=; b=NNtKnkW3igIAslhyhbu6FACtdV
	kXDnoupStnXaoX/dvOzp6UNygTZpNgrBab2U7owX0BFMyNank/XmvGDIhbuCRFAewuJn07QW8WQJt
	4teexG/TW3hMba4u+owSeKyDlMI6HiNam3jIWfp+y0gT4sytkyostpeWuuFcG+95zoQVouuGGu3Ra
	YbgyKu6QCVM4WIRDxv2SRDJgkUgUZqmu41nUtXzdVzhYdnhRJ3Z0/AoLOlUhtEax1pi9ABhWgY98d
	Q2BEP29+QkJwIMx85ttOnG2DM/W8USE2TM9xBU/bJb8aY0y8VyCo4qxst4sDe+g/9Xq86/PAH5ZTF
	fAbdmblg==;
Received: from ip6-localhost ([::1]:52948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s6Wti-008nNN-69; Mon, 13 May 2024 14:43:26 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:52503) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6Wtd-008nNF-QM
 for samba-technical@lists.samba.org; Mon, 13 May 2024 14:43:24 +0000
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-240cb6ed477so2739319fac.1
 for <samba-technical@lists.samba.org>; Mon, 13 May 2024 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715611396; x=1716216196; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TqjRrvsD66vG+1HaIiPMFwk/UXR9bXS2DrZTtIfxnNQ=;
 b=I4UI7+DuDANNDi+NGdztFOImeuNAvp7FFXN8q0oi34nHUaxlRBZR52Kckaqi7Fg0sy
 VVgZOAZwg5JNlesXvOrh71H6LpO2WtHWMzUkwc3HPXFUKYmkkL5fTbSTetIViWwtAubP
 2w5tevwXeDxxNvBCyRWKRKDVlvOfhPpawzWMCXhC5vZHOCMIiwqT3F8SPYSpOLVWEkkX
 3q7rLr2r5r2/ZVYKNkJA8JA69J4IjxkmMK9PsXLF63kFMFTs7v/OUURUWb1xzgyvLgZn
 XtNSXONRv7rvGIk03e3eeYiWpKQFbdnRIig2qscHscsQdIm23kaRh0i5EdKY7a8E/5Wy
 QI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715611396; x=1716216196;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TqjRrvsD66vG+1HaIiPMFwk/UXR9bXS2DrZTtIfxnNQ=;
 b=Ig4qFWhQBXpVRyZxzgMrE29DA5EeSx2AEXX299bxyhAMZ+ck45XTDS6K8ISXEXlfu2
 3DcoU/M/YKqzARLeO6ENtHKdNoulSiCeHdiJQsMdVbIpIQpR5Y2UL35FiiN7Dr+AY50U
 x6gqtf9P0g8JngPtYI4W4nTtxgDXosEEBdVM7LEPlvekyXNJuAG4+GX+hpufAZaXo2py
 PZK/6wjXdT2Z031JiJvMYbFvx8D4aNOw6wrXy1kVzLssZcdCLv6H/zIdkpAdsg3FK20E
 Brra5bLD8J2ZgFg1JywQZr0fjbqzvRMZfabPdxFYlCv6AByNsQ1el2aWIZbF81IM+4An
 VeBg==
X-Gm-Message-State: AOJu0Yxw4SLEV6tpm148hYwTWpQ7thAAxTFrmw0j59evS17oNstUr9V6
 ajzKOzn0qRCoH0EAtkeSarw4/oPDRNqqlA+cjhHBqyMrSwpAF/WjPv2QN83p7C8MjnOGsPZkO78
 EbSar+o50MCk3CnhZqASFF59w20Pp61+K
X-Google-Smtp-Source: AGHT+IHp2lX4YtsE9meOlgnbMDWlHJ6AtT00eFt+alVK1YQzEqsoPpPLgfo6yuGwzTNQ6UhL1y8RpTLukD/6EGreR6M=
X-Received: by 2002:a05:6870:4191:b0:22a:1cd5:dc5 with SMTP id
 586e51a60fabf-24172a594efmr12036193fac.20.1715611396272; Mon, 13 May 2024
 07:43:16 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 13 May 2024 17:38:51 +0300
Message-ID: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
Subject: Openchange and last Samba releases ?
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
From: CpServiceSPb via samba-technical <samba-technical@lists.samba.org>
Reply-To: CpServiceSPb <cpservicespb@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Was anybody successful in building of Openchange with the latest Samba
versions ?
If yes, was it a git Openchage version or some customized/tuned one ?
And what was the Samba version ?

Just in case,I founded the following quite git repositories:
https://github.com/openchange/openchange
https://github.com/openela-main/openchange/tree/el9/SOURCES
<https://github.com/openela-main/openchange>
https://github.com/Zentyal/openchange
https://github.com/SlavekB/openchange
