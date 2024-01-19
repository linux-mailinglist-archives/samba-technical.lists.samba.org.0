Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E7832FFF
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jan 2024 21:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7XTIBS/i91i08HiQFEXq8AKUEt7+r/9/tzLNQ2a1F5M=; b=r95eSgUyQuIPr9GEx055LdwSBK
	WCh82Peo9iDu2V2ThrV92PeqEqqFsNMV1oIQKN6j9O7yi5VMbWCBsP6DH9e1Hp6WUs7JDWwy2M7xL
	U4rzKhCNgkp0bvgOm5urWTgl7hhFbjX32b4/IujfwpzqlrC+34NghYwc35qQkSw4qYxIJS1GVWcay
	m0VQrxsMAPb4DVQvx7wXCDt+DO6ewLI7bTv8S6fBxB7M6Kuxm7sM7NIx9npcwR+QupQKJV/mnivov
	69uMD/Xm2x46GH96OAoiNvY7R5a6g0zGiiiaHHpW+Q5mwFpEbniCqNURGoc7lwPE160l2XT7sDLqb
	3j1nF4Vg==;
Received: from ip6-localhost ([::1]:40784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rQvoi-003zf2-As; Fri, 19 Jan 2024 20:50:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32146) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQvoU-003zea-MH; Fri, 19 Jan 2024 20:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=7XTIBS/i91i08HiQFEXq8AKUEt7+r/9/tzLNQ2a1F5M=; b=TyoV31NSHR+jTNU2Jq6B8fMVBJ
 C5wyg82MCUhWDslqZBr1R/I0m8jEbMfiNernYpKb3YaSTT62GNX9Be8IcCB71HW3WvTiCpwddBxbh
 1YEOJew/lsf+7mbov7VG6RrsDMfHBTSY2iVk/PcxghNAEZhsOGgH0aqqaZ9CmOnook8qc+xAQgaYP
 XDB7PIhy6w+xqSSo6RgpCv10gUWR3CeQfg0kFF4AOizLRScgXZRjVtktIvDR/sOxkBnGlL8Njtotx
 C/9EeRn+7OhXgHhJqjpVFhPM/ZbqvyxiAOT7q3mgOwXbj46ccVqAkSPoHNqGe58+fhM89E/ZCUZ5N
 PeNEPL3+u5OTTyB/Sl9Ja/OJ8dyKU8JF+eIzvE6CGF+xPPLXcU139dj/LQT5TAe28+WmMwEC5dv7d
 jpuwIptwHkPuvM5m97H/yyW2wOO5OCrLTvQRifhImRMXWY2Qw+nd6rcKSwJDWRTnoX44h7NE584L9
 AK7O9an1XvqU72keXKh+m0tE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQvoT-008nGB-2D; Fri, 19 Jan 2024 20:50:06 +0000
Date: Fri, 19 Jan 2024 12:50:03 -0800
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Really interesting CEPH performance analysis.
Message-ID: <Zarge/BsptXvTFf7@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

https://ceph.io/en/news/blog/2024/ceph-a-journey-to-1tibps/

Might be of interest to anyone running a Samba -> Ceph
gateway.

