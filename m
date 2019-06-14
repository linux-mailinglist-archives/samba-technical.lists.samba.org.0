Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21C45AF9
	for <lists+samba-technical@lfdr.de>; Fri, 14 Jun 2019 12:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OLyVy2vQcvDQHv8UMBZuWatVvQWr2i6LdWCg0/+ObZ4=; b=2pCedbNNd1BlxooIIFV8rX6gVU
	UH+u3aDsnlGVgU4WGtnBnQJlyt/H5Tpn9fuA9His6ZS0YVNfKu/TRNxAVtlmNS9qfRv1K33aKFUbe
	K8v0W3SXRkxYfSTfWkrF78eukykTzm216SfiQ/nVhqskjuSk04ZvF38DUKiVHfS0Awt51xt7BuYRT
	PSq5BRUdwLLB+96/ix00+PD0Vnv8X/ftyF7PMNKOMuKAowb0PPHvoKrTpgIjvtlb4q7GcEwqa6gYS
	0SCcP07CHZHl69V/xFfe0160fF8vlrW2kqZKYrtOJ2TAdaaXca3Nx9y5DqBj/QEY4s6Puw/gdP93B
	oEN0bJyw==;
Received: from localhost ([::1]:46984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbjps-000EmS-0q; Fri, 14 Jun 2019 10:53:32 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:60001) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbjpn-000EmL-DN
 for samba-technical@lists.samba.org; Fri, 14 Jun 2019 10:53:29 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1hbjpm-0003l6-Ev; Fri, 14 Jun 2019 12:53:26 +0200
Received: by intern.sernet.de
 id 1hbjpm-0004nq-Cs; Fri, 14 Jun 2019 12:53:26 +0200
To: Steve Cook <steve.cook@mandsconsulting.com>
References: <CAPKK0PPaLLXnh5Gu-EHeUGcKkATp4rva4LzcnhCU3SsACMyb4w@mail.gmail.com>
 <CAPKK0PPxz7RSLqE4NOmXah6_qvpbwM37XwxYOX035QQ9mi3XGg@mail.gmail.com>
 <52115dfa88ecbb8f13436cdf8d6641d0cda4728d.camel@samba.org>
 <CAPKK0PPpCM9AELyFhCq87pRcE4oO_oTTdYh_UZGnxEL7z-4Z3g@mail.gmail.com>
Openpgp: preference=signencrypt
Organization: SerNet GmbH
Subject: Re: ChangeLog
Message-ID: <54ca8de2-af44-0946-a620-4614379db895@sernet.de>
Date: Fri, 14 Jun 2019 12:53:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPKK0PPpCM9AELyFhCq87pRcE4oO_oTTdYh_UZGnxEL7z-4Z3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

On 6/12/19 11:18 PM, Steve Cook via samba-technical wrote:
> So that tool will fire off on an individual user change password?

the syncpasswords command can run a service. This service can trigger a
script on an individual users password changes.

  --script=/path/to/syncpasswords.script
    Script that is called for each password change

For a detailed description you can call

samba-tool user syncpasswords --help

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

