Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AEA9ADD8
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2019 13:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=W88mI5/wuI07YaYcY9KxGdpjm9X5mWzHJ6J9B4LgyeI=; b=0gfVZPJ12sNoY5gnewvFPZHg/Z
	OB8/qRTesMHK4pFMfcoMa0a0BX+jw+mL/Qb4Y7Sw8IBhFsdbOtQmNASselJo0vw4Zat7TBK+CPV7d
	pwgnWtQSWl15B3n9vl6g3FNZGtLuRSMDS9eNxseq4UK20sfgyLiJbxaTRBmbcwk/NhwZvpNWFBkth
	xHaTnMvRd+s4pnClTkG4+F2BuNbDNJhS+bEbM/zkED/x9tUiVnhKOAkrvY6x01CWJDlOTop6SKDV/
	sa/wesoOs3/rjyVefV2R0sWLhw3CF1T2JHKTJ0zaDH10OUC6m0jU+gdY/xJz7aWs/J8cgQ/PvwTfo
	Aq+tRClA==;
Received: from localhost ([::1]:44544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i17Pk-007oxA-00; Fri, 23 Aug 2019 11:07:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i17Pf-007ox0-Qn
 for samba-technical@lists.samba.org; Fri, 23 Aug 2019 11:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=W88mI5/wuI07YaYcY9KxGdpjm9X5mWzHJ6J9B4LgyeI=; b=QvH9x6WM0sUCTyttCDN9rLYtfp
 /rSXFkojssmM+OHDHDk/dclzkx8PY5W3+szCSsnhZHS0R9K5GMV29JTdrywCQ0ROc2JGYdsNuJF+f
 uS0DgOAYmkWbWar/lDG4xdU1alOoOUVad2rt75Cz/UVjQoJ//whBhAY/axaou+wUfOjA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i17Pf-0002xK-AV; Fri, 23 Aug 2019 11:07:23 +0000
To: samba-technical@lists.samba.org, Martin Schwenke <martin@meltin.net>
Subject: Re: recent flapping tests
Date: Fri, 23 Aug 2019 13:07:22 +0200
Message-ID: <28489710.se1vhCXMkl@magrathea.fritz.box>
In-Reply-To: <20190823113745.79501e26@martins.ozlabs.org>
References: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
 <20190608200729.759ac6a1@martins.ozlabs.org>
 <20190823113745.79501e26@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, August 23, 2019 3:37:45 AM CEST Martin Schwenke via samba-technical 
wrote:
> ctdb/tests/simple/69_recovery_resurrect_deleted.sh should now pass
> reliably...

Awesome, thanks!

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



