Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C113A32D
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 09:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oavLJqjM7jgELd9+KXPOxBvhZiblWs4ZiaYLPO7hdm4=; b=s+1+c29GSgB1IdtheJDn3W3ogk
	QS3DIsapeHHBuTD4U3tO4kcRJ7KqkTxyodJwY18fqgcTZUktSkV5+f9j4HRCOeRaz/Ma/sz/igz9a
	BX8CM9UmhgvPJ/6rdTm9baNtny0VatXfniZF3wrWsl6n008SxAfzMSvQP9v7RlA7LyiclEg5r8+yS
	YtwhVG0+6V3YQoVokXlFW0pF6JRD98dNESTSSQivAPN8U+1B5r9ZXlEFmdQrDz1m+Aymr/E49AAzc
	2RotUM6mfeekJ8sGEOTCAdCTrRtCbMQaWlSxg/2UnJ8Tt/lIycPoZSR5TUOOxo8tZ95qBRAs8w2DL
	gacqURwA==;
Received: from localhost ([::1]:18056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irHmh-003KMl-KP; Tue, 14 Jan 2020 08:42:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irHmc-003KMW-TA; Tue, 14 Jan 2020 08:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=oavLJqjM7jgELd9+KXPOxBvhZiblWs4ZiaYLPO7hdm4=; b=hPkoQwomuMQHZZGgyLToN9QJaQ
 I7oZD/XTx1RqTTDl9naba4ufgl3s7LYUA458rr8so0gC9NbGEyjn2gT4+U1gkaALREAIaliLpD5ef
 e171A0JZFXwU+OnrcjBkemJxf9f+lhAhQgr+H83YBz7Jf/k8jIpV/Z4uKP3NeUbHoEc6cT5ukhngb
 nqJovyDLzNTx+gilUCt+MTn0eBDnQ8fJ6FsqkO8yE2ci6TCy4MO57RLKzEpaOnhafMTIZx3pofJvX
 UPtAtP40YwUUbU3pqEKvCQ+6f6IZkgtcdjenaWC2ZrvD1Y5/e0Xn2R9odUqsy1m+B+qnq74NCLHWb
 JiPCneKuv193OrDgCDlCLWYCvHeXSW79nsL3cWhDPRX4PKT48ubLbfifav7M1xlrBlFbGtmr2Vvxw
 e8jfQuG3xAitplEndMOhBA0Vz4teJS8G341yLcbNiMcer1rdDN3VxKGMuC87Y+N0SBCbXKl6NwTC8
 mf82RZz9eixLjHnOvSfzwQUi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irHmc-0007Yt-Kh; Tue, 14 Jan 2020 08:42:42 +0000
Subject: Heads-up: Security Releases ahead (January 21th)!
To: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>, 
 samba-announce@lists.samba.org
References: <bea68fc1-5478-2c3f-f4eb-58b42fa87015@samba.org>
 <9b8d6045-24d8-2c24-86df-abecf168e703@samba.org>
Organization: Samba Team
Message-ID: <795ee5d1-e602-d217-beb7-0f9d6ecffe4d@samba.org>
Date: Tue, 14 Jan 2020 09:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9b8d6045-24d8-2c24-86df-abecf168e703@samba.org>
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

Am 13.01.20 um 10:48 schrieb Karolin Seeger via samba-announce:
> Am 07.01.20 um 12:40 schrieb Karolin Seeger via samba-announce:
>> this is a heads-up that there will be Samba security updates on
>> Tuesday, January 14th 2020. Please make sure that your Samba
>> servers will be updated soon after the release!
>>
>> Impacted components:
>>
>> o AD DC (CVSS 6.5, medium)
> 
> I am sorry to announce that this release needs to be delayed.
> The new release date will be published as soon as possible.

new planned release date: Tuesday, January 21 2020

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

