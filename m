Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5C14B38D
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jan 2020 12:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LLUYXuaR2YqPreLwRWuyeLyTBMDmIpUGdFFRO1v+7IQ=; b=TuGXtUqtqdZH2RWY2zP+ODi1a+
	DPFJOGr1Hx8kY/eQQLTLo4CtvUoC7YdQsuWzyxuuyUTIas4ZR83n2x4ItPH/yI9SGtMfdV6iZGjC0
	8UAFYHXvepZ0oSFNizmQwH1xpqBrc3s4utgCK1kJ0KVhhHXeQ1n7ahQSU0MOz8VjsyX3A1yZ1vFUs
	DQLGTnX26dO96YpUOP6mxNFtentqbKBPWktQdMPtrUzlZS79EhCJnb+CL85Ht+gFCdr84nOUZVKn9
	2dZha979PzmUUpkrAeCQ38WJVGFxWA5TeNWU2SdWVVnJ86abKtRE100Sg4xYBt9UBpY2nTFJHvz29
	uIytaw0Q==;
Received: from localhost ([::1]:55750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iwPBg-0056GZ-MN; Tue, 28 Jan 2020 11:37:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20318) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwPBc-0056GS-7r
 for samba-technical@lists.samba.org; Tue, 28 Jan 2020 11:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=LLUYXuaR2YqPreLwRWuyeLyTBMDmIpUGdFFRO1v+7IQ=; b=Pqp+vdUD7D/jPuLPVbRuM4iPD/
 AgT5v84Yuygl82BVpKHJjH3AQBRyBEloineS2pSXXJJJ/ci0ELZ57gxw5BsasHKo/kAJZ+rwjj/0B
 KYbZGfSjISfKK3KCGYqdSBF3EArgKsYNEHE91dRKWpiZ5sqH2GQadHyEom0v4AJXQC3IJcE2sO7DN
 yubOWHCmWnVjHBHlXjqC/cKhiv6zz++z0SSdUbYD0kajJFfVXF+PVWitcwemhZBTrJx2fef7nmbZj
 YxavFO/UoQx4A5Ky5BLTuJLgDBNRoBdP4LccQ/ISnEd7STDFLB2kZOwBcyqzMhFB09PV11BbgctKp
 wmgMI4kU9YOREN1VOYnNcvnu16/DKdqQlk6w7+52pJxdpW475bFpmI7VTv2tll40f2EmXdd/FcGLW
 5qzo+tLYACe5v4uhXElwIr7AAZvfR6DZ8/Uda+QC6iot+cfTN43c+xRp8v8wF+6PNDOVOxRoLFVvi
 g5btnVXoZKebqMnd3kfESVKR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwPBb-0003DY-Tq
 for samba-technical@lists.samba.org; Tue, 28 Jan 2020 11:37:39 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Samba 4.11.7
Organization: Samba Team
Message-ID: <36547767-0535-93e5-ed5f-38665bb68ada@samba.org>
Date: Tue, 28 Jan 2020 12:37:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
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

Samba 4.11.7 is scheduled for Tuesday, March 10 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

