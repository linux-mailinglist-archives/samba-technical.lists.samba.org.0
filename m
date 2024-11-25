Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4A9D875F
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2024 15:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=l7rJhwbU4HUJ1GgIHs98DyYxyvUvYooTdWO8s1CRFf4=; b=zT86P9kjG/qphrZyoLxnEE4ec6
	r+Zb+qEQclnk9nUcVB6oVrBe04lLBootB4Z4Ic2hTBUYurI4bK79aQYqKgWYZk5n9Cg03eaAUaxQ5
	jNA2G7lZllX/MXZ3fjBi3fUt1FpRDEI3RX1RMaOfehobEZ1+ohb1m0VsgGOwDdOsnnhb98QmTS3w1
	hS+pKGxGnR/RXOfWvL5r+Feo7f3x0yI9IwPxKzSGA9+7Xs/cf6uJQiIrmBa9PZTAKVszY4SqfQAuJ
	T7+lWgNEz6nDR4MEeo1Ke5PEYfeYCI1o0+gY2ZogRpQkRMjB1MKkeYpZZkOSoSRdir5Qt9ToIxCXD
	q0vixjhA==;
Received: from ip6-localhost ([::1]:47024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFZlL-000jbB-Uy; Mon, 25 Nov 2024 14:08:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38538) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFZlG-000jb4-P6
 for samba-technical@lists.samba.org; Mon, 25 Nov 2024 14:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=l7rJhwbU4HUJ1GgIHs98DyYxyvUvYooTdWO8s1CRFf4=; b=OSpJep/vBXNnvMVpoB22z+qFgI
 SycezKJ6XWy4rEgzZ9ghbpQaYZ2MtyLrbD3eSt2oqL2YWDijcXIywZD0zk+zjw2Yftgc+G47YTuBj
 SpDYGqzTTL2SvItci3X90CDrAJssK6JFzssWMFqENk5y+v5IU+VmZJ3h815rKsNcpklnQ6tgayf61
 JOrT1xlqvO19fLzOlQ389iKEyd9tCWPoyCoZZUNZBQ3+75o+cie6lzpFKQzODjohsfvV+heVe+5zw
 zBNQps5JRrF/a8kBAfbi3YXJ1tK223MOLajx0EDDLEv5+zYfvW1VCsHprm02Q08+hLhOPYhZTb07R
 URJzgqLMOvE6uSZWtQ+RJDASggJaGAjPcdCfZCL0b+6THCtlKaHWe2A5qb4xqvlbiFq4LIPy9QktC
 TOXn5IiWSHXJYADAL8jVWLJXXNqxzR9JBfTrd6xp9+SJNxJDzvXngVQvHegV4DGb2xnG6cq2JXzjN
 EdvuCXd9qJAjB3vkHDdrx4Jo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFZlD-001Nzy-2V; Mon, 25 Nov 2024 14:08:19 +0000
Message-ID: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
Date: Mon, 25 Nov 2024 16:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: heimdal 7.8 crash (in OpenLDAP) with spnego/ntlm, is this familiar?
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Nadezhda Ivanova via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nadezhda Ivanova <nivanova@samba.org>
Cc: metze@samba.org, okuznik@symas.com, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi team,

An OpenLDAP user encountered this issue, and since Samba also uses 
Heimdal too, we were wondering if maybe it has happened in Samba as well 
and was fixed? Do you think it is something that can affect Samba? There 
are back traces in the issue but no steps to reproduce, it seems to 
happen randomly in their environment, and we haven't had any feedback 
from the Heimdal team yet.

I could not find a relevant issue in the Samba bugzilla or the commits, 
but perhaps one of you remembers something?

https://github.com/heimdal/heimdal/issues/1189

Many thanks,

Nadya




