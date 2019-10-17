Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BBDAAC5
	for <lists+samba-technical@lfdr.de>; Thu, 17 Oct 2019 13:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9oMaFaEmxQFBT0qUjwmpxd8yewpIJZDu6PSJOXM0giE=; b=bxbsOxbRtOWIVvXlrRTUSuBsVt
	eZapLmP6tNHUCrSVGsEKdXIT6czfmKu+d3483662OuATCZHKL0WWml32l8kCwSJRyM67hOdMOiLk5
	hvyTK7+0uqI+jK+Kjlg7SwUm5JHsekmn7KLo/0rC58OFRl9oPnANEn4Nm40e7fIgUj9rHW0sufoly
	LE2lwY5eDNOI/y4L9uve3VCBOkK8jH5A2wd7g34L1JJ976ja46pGxcWESK3r+sSmtrFX0VxYRvP+D
	lb/qNySxR9gWbIbRXfkWvtQyxeKTrxXtmhceTz4vK8mzr80ysInbaJQt87WH0Zrpm8eknD/tk0KSh
	jRQ/xf1g==;
Received: from localhost ([::1]:37662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iL3aM-0001Oy-IK; Thu, 17 Oct 2019 11:04:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31606) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3aI-0001Or-6e
 for samba-technical@lists.samba.org; Thu, 17 Oct 2019 11:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=9oMaFaEmxQFBT0qUjwmpxd8yewpIJZDu6PSJOXM0giE=; b=eXlV0tQ1bW3bV4XzsmJIFo2wsw
 sNEMx/fVELdNqDnXMxzrQR1JbzADaNWl/scT1kjP+p327wlz2UqzcB3xbBgOZTa+ZB/zx0BfSH1JO
 oqk9hejWoDhqWgL/bd1SIjyns2KHAXto/UFi5xnrebIUD+ja435PxTfSI4uqu1daGhUfROtCqThmU
 IonnTS7514v1Uj1WVFnb4z1tUlfuKU+BfZabrlhHX/MEsOfS7kegr/CnDauVwqSe2e8e9yMsWUxKb
 TEASJWZp9DuH44ZIhWzflfDkdeIK9iX9obdCPucPTT9oBLGBANG6OzBuUpqY6mlUEIF36FxLjvMJx
 kRKC6F0Zs3lmjhgygJAs4mOV2cFcOyeikWWEhMbKTd9t4H8NnQMegH9S86oSlX6VNFp0w0WTr6EcZ
 y2VgzmMMYe8cEE7GGyww0Jt5UEhQLRsVzy3l7d+WQ8QuHvzKozNde42+qGlL7NpRib/B8K70Dq39g
 0/0z3i6f2hHvBoagOD/XkhQo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3aH-0000dQ-RO
 for samba-technical@lists.samba.org; Thu, 17 Oct 2019 11:04:45 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Samba 4.11.1
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <1935ca16-517d-292a-cc53-29593a80aa75@samba.org>
Date: Thu, 17 Oct 2019 13:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

due to some regressions, Samba 4.11.1 will be released tomorrow instead
of October 29.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

