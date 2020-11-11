Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3582AF781
	for <lists+samba-technical@lfdr.de>; Wed, 11 Nov 2020 18:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QoDrnS2/bmTpepOyMT9vh5TeE47rnrMgAI4C3n0vIDo=; b=z9S1Tfyv9RSvZEY8g40KR8cD17
	W9pUs7CDW40Z8y2cxXyScP3QdubS2oUnA5GxAucsb5yRVg31l+7UqpxDDxWzInhwStmNPm7ymd63R
	7TKOg6WzEAMiMQME6pReZNSvX183sDT9/Ema7PBrerlmmNK9pGNn2umG5X+0NN5irNHC2vo9uDkpK
	na0q+HCr73uOvXKFLGEowSEqymPsuE9YBoIFSrBwoSBWx8Y2XKSOavm5+R05kN8zQ0S+7r+Kemz/n
	fJyXw/nRtisSzFYXRInjDF5v4Nt3E8yb9Xt5JPBVfWbW0PRWlXcr7CV5qX1TPVV0pVt7/odzsn42b
	4NaW9XsQ==;
Received: from ip6-localhost ([::1]:29116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kcuAy-000yLY-G5; Wed, 11 Nov 2020 17:44:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcuAt-000yLR-1t
 for samba-technical@lists.samba.org; Wed, 11 Nov 2020 17:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QoDrnS2/bmTpepOyMT9vh5TeE47rnrMgAI4C3n0vIDo=; b=q1d7LFmG/s7yoyX8dot9Qo5gLH
 /1BaJNQGA3yebgdNFX4ijYj3zPbI/5mJgGG0LaZDamamx7xG2uHo1EQbDOT9txjJUinbIn6vB0da5
 ngX3cIh8Ov++X/Z13jCAwb2RaxdBdg7eNpTr+UnPk5JupHouafeBweV2IQaqgdfZ8p9Kz8h2eAoOl
 rS2xSxznsoCCUoiMeqz669HvAc47Zjw7/GaCP5btMUOnjWPDWzN6mvq7Q64BFingyERV9TxdxKBe0
 x4ILiZPheijPOEE7icgMfrfa1YnlVJZ1hoTEJhyLO7BzDq+HOLX3owI6JbSdZoXh773f2Zq5fadiG
 7tRG4gh3MbqXNyVorduSYwpAJ8tfV652Oap9JPytESX0RWbSCSBaikVfvSJIv44By/+urosefHjjp
 2kJ/f9xRdmBhv64YUwv0gGXpGBrOFQlRb4hYomXg1ygN3m8Bnk7JySUqt51k/FVcYNrJuGQ1Abh/n
 s89e19oq9kGqeH3qSk9KEq/m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcuAr-0003zu-Sv; Wed, 11 Nov 2020 17:44:50 +0000
Date: Wed, 11 Nov 2020 18:44:48 +0100
To: SATOH Fumiyasu via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Eaten by autobuild?
Message-ID: <20201111184448.4942ac61@samba.org>
In-Reply-To: <87pn4loc5e.wl-fumiyas@osstech.co.jp>
References: <b70db8da503720b24dbadcba32d95556c108d01a.camel@samba.org>
 <87pn4loc5e.wl-fumiyas@osstech.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 10 Nov 2020 17:21:17 +0900, SATOH Fumiyasu via samba-technical wrote:

> Hi,
> 
> How about the following patches?

Thanks for the patch (and demo :). LGTM once it's got a sign-off, as
requested by Andrew.

Cheers, David

