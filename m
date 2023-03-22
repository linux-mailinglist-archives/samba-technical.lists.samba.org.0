Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B86C4B69
	for <lists+samba-technical@lfdr.de>; Wed, 22 Mar 2023 14:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AY+ZB0TWAMcu01+awhjfV8UyLzl67efTbpzIV4jDJ0A=; b=1sLbq3pX/m2yFgUWYAb1yi6jOV
	+ADF/cUzSsOBZqH1dJZ7IBOjxKjKpi1PO+Val8RLi5so6WOmwzpS123SFqgGlWKNXNljSAi9V+roe
	1Se9RDx/ALIUADT+lIhzMUXM4y83O/uE2nQi3RbByJgDgn9p40mGVWH1Qmz87mrIywi6pJzP33NRe
	CfWJsFY+IDysU7lFyigEs23EMW805Rlr1I3E5sV0l6Wj5fc40E7f6l7yQS9Y7+mIGEY+Hrh7pzRD7
	d9+AwCf5M4M9FWy5Tr54QUKlIDUYhbWurJtEbRFCF0lHRSkDGjuzfeb33GqJW57OFE2CCWPl6Xjzm
	5aST9CPg==;
Received: from ip6-localhost ([::1]:20420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1peyHF-003vwJ-7g; Wed, 22 Mar 2023 13:13:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47652) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1peyH7-003vvj-2Y; Wed, 22 Mar 2023 13:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=AY+ZB0TWAMcu01+awhjfV8UyLzl67efTbpzIV4jDJ0A=; b=sGvvzmKdOqZZrts/FZZC4xIKga
 G01jPEQI3sGTDXOcajEcmA0c3ngT/1P2TpeHTlaScw9yCy42SfwM85A9auV52ZlyJGCkistk8+NjY
 Hirh3q8yG0I9LBsEYxspmQr02YhXVsyx1w6Ar0H9LeVBgCbD+KBGvXRKhQXk6/3O3um+TcxQj6STS
 oYQEGdJ+E7fhew6Mtc+ektzbSbRtpuEnlcDgG4zE7MfRX8Tna+R5A5OCztcqUuwaZ9Sa2SSowWtVd
 XP5Y+agigJWQz627ZYbLWztyuXaWfjABtHX0FEauEPXfvj6tsQiKMTYcYayNYKKIPQ+ancXWBe3Bu
 /nwuhfOD8XXfni237Izns1GRM1Vx4HyH7PR6vU0SQHYHc5ziGKvxXTHlWmfc7dRXScpFRuqzrlQDC
 L8pmv6VzUWljhSOCpallYtKqY7X5fXV8eLbJsHyGnUkTTdku5brGtfl6ZCXJ/TZysnFFbhZZ88Vie
 C9kE/SiaKCVN4y9VcjymNPgK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1peyH6-004rYy-85; Wed, 22 Mar 2023 13:13:08 +0000
Message-ID: <c92ab9ff-95e5-e4f3-cfec-5ee7e0d5b460@samba.org>
Date: Wed, 22 Mar 2023 14:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: de-DE, en-US
Subject: Heads-up: Upcoming Samba security releases
To: samba-announce@lists.samba.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates for 4.16, 
4.17 and 4.18 on Wednesday, March 29 2023. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted component:
  - AD DC (CVSS 5.4, Medium, andCVSS 5.9, Medium, and CVSS 7.7, High)


Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Team  https://samba.org
SerNet Samba Team           https://sernet.de


