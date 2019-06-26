Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AD57306
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 22:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MrsR5XuLN9xP8WBqngMytlDH8HxiBIeDRJXNw+Ovxu4=; b=SxRM8PEL6wbqH9AApFN4fWX4wq
	tZkA+55xxnTSzpqaF7SDusbheKRiilKgPSbuFjMr+jaG1RT+i+TW0Zt45hzPjsAK8cexFgPF/uGvO
	uDOwcDbnebBOqQk39DDeyU7CNEDhQEGDdG4LNqd247NivQv7L/mRwtbXPvCZAHb9GpKV/9gYA6rWq
	yLE+49tP01CpfSNCkVMoOPVW0e4uKllDwuxL2/eP0FJdDMcF8rZjY4nI5f5w+sP+R5RNp9Tu7txtJ
	oX78/GJaeSoDjBk9g2mzwiDrtTPkpChTDaift+5lxFn8AwKB4pn4xTKWoGErkoQd8aRnHN3XMHDEv
	RMgcxc3w==;
Received: from localhost ([::1]:27520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgEoO-0021Lo-1I; Wed, 26 Jun 2019 20:46:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15316) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgEoJ-0021Lh-QE
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 20:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=MrsR5XuLN9xP8WBqngMytlDH8HxiBIeDRJXNw+Ovxu4=; b=Tti3rTHLh1zxcK1I/Lm0AsUE5e
 DCq789udbATw/f0JWAzQ1px5LeF3L2TXiztRdjw0eyl3bOGbo3OETjSoqD3muvyM98AKRe42+mc04
 hN0m+9bW4bCEMKr/o4U6e+fosiaAtfqfxbWpsyIe0GTQyr7XK72GY9QeNjGwZz4pga3I=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgEoI-0004zw-DI; Wed, 26 Jun 2019 20:46:30 +0000
Date: Wed, 26 Jun 2019 13:46:26 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
Message-ID: <20190626204626.GA15143@jeremy-ThinkPad-X1>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190626181233.4fc61c42@samba.org>
 <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 07:59:08PM +0200, Ralph Boehme wrote:
> 
> Thinking about it, I will go and ask MS what their client uses the
> server provided File-IDs for, if at all.

This was just touched in by the MS SMB client team presentation,
the File-ID's are used to uniquely identify files in their
buffer cache I think. They have to be identical between the
different query methods at least (that was the question that
was asked).

