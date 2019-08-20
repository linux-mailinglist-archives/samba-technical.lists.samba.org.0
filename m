Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918795C63
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2019 12:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lylrtSazloAhH7hptulBfa2mWtRD83ZKEqC3Wkh+2sw=; b=dAu8+eksr94rwBfmsF7HK9vH0G
	3GI7MNXuZRRDEtlptSNSQ+TUr5j/cqaUJNYSw6B4C7NYBin5gRIdHbiPenJr53ktKfnTBXnb8AVer
	FYsYLD0xeCuu3Lwku8qyVj8AGwool+qrb0F5LthiOXaXkv2nMST0Gd1X17L/hGFemY9mdD5W3Ao5R
	uDxYsasDgGZCJfdv83XnYnvUcLR4VGcku0wPwCn4AG1xRdKGIiu2QUf24DN01KVC1ntkXIZjS/dcd
	FNBcIyLUCIw+n6MsOI0yVwCVVRhOmScjmcIO8pm2vu5WZdmUf1xWeYNyO3DuosJdC50IojPv+7JE+
	tMysnGRw==;
Received: from localhost ([::1]:56188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i01X4-007Dfa-Ix; Tue, 20 Aug 2019 10:38:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30806) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i01Wz-007DfI-Ft
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 10:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=lylrtSazloAhH7hptulBfa2mWtRD83ZKEqC3Wkh+2sw=; b=n4nplfYlZ0FajvX5SLAdL01Lx0
 F0A+KKbdJaWcYZasVCch5bDG9PIwP7srLoUT+Y2YD7storyQNKJ7Wblsi6S4skGfVVVXqKBvmlUBH
 YpVcDryMTaw1Ew/VVq1ETP5NIjGf3L3jIfmSxz3pi04+u1zHZKSkgYBuPNakIl+ZSFtE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i01Wz-0005H7-3h
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 10:38:25 +0000
Subject: Re: [Release Planning 4.11] Delaying 4.11.0rc2
To: samba-technical@lists.samba.org
References: <81b761b3-676b-b3f1-1fc8-589f744b2c2b@samba.org>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <5f29fb14-11b6-3f86-3804-6ea7020b4573@samba.org>
Date: Tue, 20 Aug 2019 12:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <81b761b3-676b-b3f1-1fc8-589f744b2c2b@samba.org>
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

Am 06.08.19 um 12:55 schrieb Karolin Seeger via samba-technical:
> Samba 4.11.0rc2 will be delayed, because library releases are needed first.

as the proper fix is not available yet and I have no idea when it will
be available, I would like to propose to ship RC2 tomorrow (after the
ldb release) without addressing this issues at this point.

Any objections?

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

