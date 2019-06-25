Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A19695241F
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 09:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/tE1Fx5T3MCaNZGp4a4wxu/HqQVhb2s34fWhKprBIv8=; b=rfiJhur3KXZQhRgy8oXOdl6DvL
	pxR0Cnnw6Sc1gXO0k+BndNvmOBjuyN1FST1+RYSpr/Soa0jPtwLXWJmiLF2+ooKR01r7Ckm9k5V3r
	nYqXGXSsvv+34AlKY3f3lLKulXwLnHEJrdSFIFc4EDdkNFLGvWrsSTgDVbU4YGQQT1SmDhFUNK2cr
	EfMl4OH/mLcxLSbMXRCzZ7sz2UJCHbbuaaWYsVNbzA1Jzv5R+GHP3f2KuHp3UAKovctpmZGhrBqHq
	ELPLdD+Ef1c5lsXff/EemLKrdeOcs2CyQs2IuuIhCOon6+wFSfzJjWnP6KOiX6Xb7GLpgZmbJW8IF
	FkEBNhNA==;
Received: from localhost ([::1]:41952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hffcl-001Z9o-B0; Tue, 25 Jun 2019 07:12:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hffcX-001Z9g-EI
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 07:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=/tE1Fx5T3MCaNZGp4a4wxu/HqQVhb2s34fWhKprBIv8=; b=aB5uGDUssGe1TP+wVgRFR/OXyd
 nsjtGvlFKl6AeYhv2ga8egP8eRQihQ1Uasfj2UpQ07kjkc+2B8z/hFOrmLWyv7LEfsigNISaQSZaH
 KYumYAva9C/WLKrsEKLZMoHXKBJRAQYV450/FOgT/RsJavsyAjK545/2IZ+DM6DLfBXY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hffcM-0008HS-Td
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 07:11:51 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.9] Freezing release branches today
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <bc87b9a6-2b10-be67-552d-75473786320c@samba.org>
Date: Tue, 25 Jun 2019 09:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
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

this is just a heads-up that the 4.9 branch will be frozen today,
because Samba 4.9.10 will be released on Tuesday, July 2.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

