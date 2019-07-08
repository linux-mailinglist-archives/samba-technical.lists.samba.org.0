Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7262C45
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jul 2019 00:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=rXufY4KZPU9Tg2wkkLBL952k+v0dT9V9oKRuGnUysHo=; b=CLGtkRD3NK9gncHoAIpjJxj01Z
	9A2F9BoXdwlOFpsxV+GF0BFLY1fBQ2WZoV5HdU8cpI1t0nMqMW+tt5I4jVaR8EY5Sp0vD/maw7Wia
	4QYivxLPmvC3CYT3bvcg7KXaoWBJRdZRWCzjrrIhif8XrVfd+jdv5AgijZeCszEyBMssmFZvGiHkR
	owsuTA2Q/kv99MMC6vgOodXj5OT0xZ8cHibr3iuQKHB4uAqlNCm6H5swKzbOJecNfD1TMtO/imgMl
	+l6I1omF1loSvAy7Je3GCHT2+M/idfMoJOOKYi50aay1MNuca0DgMAIUGisKtQDSBFkmK2EoOEb2v
	dVHgxw8A==;
Received: from localhost ([::1]:33916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkcYY-005vOE-OV; Mon, 08 Jul 2019 22:56:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60616) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkcYU-005vO3-7j; Mon, 08 Jul 2019 22:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=rXufY4KZPU9Tg2wkkLBL952k+v0dT9V9oKRuGnUysHo=; b=viJ296/hjQK8Bdaodp9ru2/OlK
 Wbz1qqlKzgYcihYZE7YiHaVralhOKsL73ZAgHUXBXVJJ+Q47OPgPJbDDT1bEsPM/PojQzu/wHmJ9u
 K6IhSoWWAfMx87mKZJa2axuMExuWFggGwzOvgpBr66HZungtM5YvWf14eLnExEWz7J5s=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkcYS-0004HR-FN; Mon, 08 Jul 2019 22:56:16 +0000
Date: Mon, 8 Jul 2019 15:55:58 -0700
To: samba-technical@lists.samba.org
Subject: Ned Pyle at Microsoft mentioned our SMB1 deprecation for Samba 4.11.0.
Message-ID: <20190708225558.GB69464@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Apologies for linking to twitter :-).

https://twitter.com/NerdPyle/status/1148296347449036800

(full disclosure, I did give him a heads-up
on the change :-).

People are happy !

Jeremy.

