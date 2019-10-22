Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB21E0274
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 13:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ccpBekOHcV7hXpfC/AocwQN3+M8bLDWqF25E77n9MAU=; b=kprFwciVHkkVDsD6UjIRHCaDHg
	+lgxyi6IDUwd9rDq9n4pqnj2sLpy4XkYwxKeBAPbyFvXZgMTysirk2Pj6Q9JKNXQ8EjwlLg7mvwm1
	ZYlZECVDuUeVuqHvHoKPKaC4zDfAZvyl/uxrG/DmMh4YzRDyX0sFKQU/gMkW/ezGu46hQzipaenGN
	KVdrVX6713rFcQTd/If0PzpOH0mTdpJGZ+wArP+SDKzH8IqxD1k0s3L3CCOcEtVKPLz7xp3kIYRBn
	LXr8S09fyciKLhVgnbjHeSz3LD1SL6OZYaoTF7fp750m8c2n6rSSnNxu15uDG1p2vqCxO+vw/NvYk
	HOKymkyw==;
Received: from localhost ([::1]:51716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMrxz-001MzP-91; Tue, 22 Oct 2019 11:04:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMrxs-001Myj-3b; Tue, 22 Oct 2019 11:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ccpBekOHcV7hXpfC/AocwQN3+M8bLDWqF25E77n9MAU=; b=LQFcjkEldkwgAVOgtg0WR8JoKm
 jJsAuCQan0D5YBhHJ2keEPbswX0SVZQP3EozyIE3ax8lyHm9llqWqyPzze5FYI3KvvJ7e8vOYkXbW
 EeTdCBoQ/f90jO+/8b1r53OBKBfkTcQXv3bsu23LUn+O1Nwsvep9wi4K8IKFzzCkAemnTvwwpUa1m
 YR5uY+89yMIaXLQA6S7Nlg1uybyNZTFdQe6FijkZeRtz1xaRv8d6mPpSPQ/9by/xtW0Mtnm2kTraB
 KEptFcyb6JRz2fXqM4UGh5erPoU8iKUh8qVQ5DT9n8gpMX7ojpq3K4CTA0rhAGUAvl8WhxnRM3IW4
 bSePXizsXLsboKcKJC0bqOoXKJPWTuZwU6a/Xh1U7oUyVD4txR49/wjPtb1gC4u6zZs0oglm6TyHN
 hD6OC/frI3Lkf7tW5fuUOxaWWGFoVsxhSlm+qH7J+iLp20cMFLlHIe4QrQlADyjyqf2bAHnCwf1pg
 HElxZ4aRP+yfAYedtc2dom/p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMrxr-0003P3-LK; Tue, 22 Oct 2019 11:04:35 +0000
To: samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org, 
 samba-announce@lists.samba.org
Subject: Heads-up: Security Releases ahead (October 29th)!
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <ef0b185b-ded1-2732-3edc-a15d385df004@samba.org>
Date: Tue, 22 Oct 2019 13:04:35 +0200
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



this is a heads-up that there will be Samba security updates on

Tuesday, October 29th. Please make sure that your Samba

servers will be updated soon after the release!



Impacted components:

- Client (CVSS 5.3, medium)

- AD DC (CVSS 4.9, medium)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

