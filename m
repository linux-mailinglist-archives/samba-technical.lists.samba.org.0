Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA41D49F1
	for <lists+samba-technical@lfdr.de>; Fri, 15 May 2020 11:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Rpe3ljUYZMwy0prDmyPuuqIWcTPPnQBz4aCg1XK2dC0=; b=pgfuwZG/udrzw2/Kx8Bzd+zInz
	JPlSbRHMJ5Hq6ZCv2qq8axDPjrTpwkgnwqBR/X6fZL7n3zMkd8tCgAfXT0l5VkiUMoiziQ4UJ41du
	ZzToOnduviYefpjf0+GPwhfCWbJ2OdUUaS9c1efnKm+nRqs7udzbTSYsNKzmpgJlNm4BcgkiGLGt9
	HsZAHPrYnHL8xb3WzD660jQuzc7xwdGAFbstpCP73n5OJixlcKsJ/hW9rfxlUiXpsyC1QBGp3vBom
	2syOso6Kkwi/7ky5j9J6uIYcyd+kTV/vdEqHVeddQOyLe4n5dzKaxIYpPv6QtzAMeQKQ/uYd4ZpPo
	RKy/ywYA==;
Received: from localhost ([::1]:56840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZX18-004R32-Il; Fri, 15 May 2020 09:52:34 +0000
Received: from [81.174.151.90] (port=50144 helo=mail.gunas.co.uk) 
 by hr1.samba.org with esmtp (Exim) id 1jZX10-004R2u-V7
 for samba-technical@lists.samba.org; Fri, 15 May 2020 09:52:31 +0000
Received: from [192.168.1.101] (alibythesea.plus.com [81.174.151.90])
 by mail.gunas.co.uk (Postfix) with ESMTPSA id 1B20E5408A6
 for <samba-technical@lists.samba.org>; Fri, 15 May 2020 10:52:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gunas.co.uk; s=mail;
 t=1589536344; bh=Rpe3ljUYZMwy0prDmyPuuqIWcTPPnQBz4aCg1XK2dC0=;
 h=To:From:Subject:Date:From;
 b=IIVQ8AVU7aLa3Jxnb0y9iSk8CBKew8lh1LLT6ERTCq9sZg/1cAO3SCe/mIx0plqvv
 e7U4MqEE+SLYg9NL1ZprJwoPZNKaWVLTqViLDul1QhpYUEbs4tc0hEcJ69Ugp36xTF
 fT4zKWUebavuJmtUav8kLZmGA+pqko1GQx6lS2ZSsR2F4tMNUPOw2FIsMiclvY2d7a
 Fd1KSR/e3sGUkNwLnFzFkL38+jnnUGVaNrE4k8ODl3C9Qs7ULYLSITtkthA9h394Th
 lP/0SB2MByI6xsTxFVWBM3P5svpIyeCUurDyuB7ym/6JdA23n7AoFifHRVMj4+8nb7
 T4EE8uJw4Fk/g==
To: samba-technical@lists.samba.org
Subject: Re: DNS problem ubuntu server 20.04
Message-ID: <498d1db3-34fb-a2fa-80fd-3f881fd29019@gunas.co.uk>
Date: Fri, 15 May 2020 10:52:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: RickJC1 via samba-technical <samba-technical@lists.samba.org>
Reply-To: RickJC1 <rickjc2@gunas.co.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Rowland for your help. I don't know how I missed this one.

Rickjc1


