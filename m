Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 913CC845A1F
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 15:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2fvjqI9kSOJTgoKK0SKf9zUYhnsrfT10U7ENfrwg0KM=; b=WZexzH9CVg/DSn2ZLRYRSo5JVB
	fJpTHBMNeJSB35aip++YlugKrRj/4x8eu3Flbo3jP4+o92aIG2t6+iPHU6v3G5+iDlp9KFR6cvrmO
	0odhSQTPA/BkjArieCDPsEhCIpJ+E2gLD+7ZhMTzowUqA3hIAIIQgjczMDORNrJjiNDTH88gvf0AX
	6uLhC7zNHnbQ3BYj0TekRNPPFqwW1QpqjEBd7GVy7LMzb58VQAwS69jpb2XN72UVOks0hscdSf5PG
	62G2HmlHMlM+mGJjEfsRwn26oeG50SqjuVUUBVsJB+gPbtgwNxmh3jfxkm45WXTv+ReT7mnvO011s
	DdI4i2tQ==;
Received: from ip6-localhost ([::1]:62914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVXxq-007Gl6-AP; Thu, 01 Feb 2024 14:22:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54452) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVXxl-007Gky-46
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 14:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2fvjqI9kSOJTgoKK0SKf9zUYhnsrfT10U7ENfrwg0KM=; b=QWFoyYyE0PIj5Bzn7OsT2Qo5GR
 SuURwENz+vCku5F71zUmJ1O171hhOtNRVRwXPv0OAGJSdViUCv8H//Aqr64ow3wkAOUoAND4DZgTY
 r2IQKGHOjUqg5EvyDqj6nWdobpDGxRDc2tyzuAG1WoN74AjaS8w1npCzz+JLiJDS2pZsx99Rfrd9X
 opmKwYNVaSFZg0tFhlbUKsomb+TZrMQly01u4aUGCNQXvrbZh7f5fLPjAQYzC8+OBksBu5hBt9Tz1
 gr5i/apyd8dUTQbHboGRXw39e7lPv3D+NhMOSzWrNSFZKhC71rFXpqVXUGjEoSW7gg6s3gk7MQNmp
 qODi6FEPDG9jvgS9R/xak0O+kjQgWpZM7kN43dSQW9tN8AIafqdVNYCFIFO6HNMfgEZCuRpdCUnxG
 1dUIbnfDzZ2qpyz6ba9h81HQ0/Y1gjq9TNhFdBvxwqxTx78EkWCW0rs0M1IeW2W1+1fX8lkCUzPN9
 ns8VSmWVcWspPtTVGA8GwTxD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVXxh-00B1uT-2p; Thu, 01 Feb 2024 14:22:41 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Looking to once again re-bundle LDB
Date: Thu, 01 Feb 2024 15:22:41 +0100
Message-ID: <2272182.vFx2qVVIhK@magrathea>
In-Reply-To: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 5 December 2023 04:47:56 CET Andrew Bartlett via samba-technical 
wrote:
> Just a heads up that I'm still keen to reduce the burden of an LDB
> release at Samba security release time.
> 
> The rough consensus at the end of
> https://gitlab.com/samba-team/samba/-/merge_requests/374 seems to be to
> make ldb:
>  - for public consumers behave like any other Samba public library (eg
> libwbclient), by removing the independent tarball and build system.

If it is done that way I'm fine with moving it back to Samba and do release it 
with Samba releases.

>  - for Samba builds by default, to install ldb as a private library.
> 
> The version numbers would remain, but could then diverge between ldb
> and pyldb-util for example (they would no longer be the tarball number,
> so would move just like other SO numbers do).
> 
> We would change the ldb modules dir to have the version string in it,
> so that modules are not installed for the wrong version.

Sounds good.

> My current motivation comes from working on a pyldb change that would
> change pyldb-util, but also a long-running desire to make this simpler.
> 
> Debian currently has this patch:
> https://sources.debian.org/src/samba/2%3A4.19.3%2Bdfsg-1/debian/patches/Forc
> e-LDB-as-standalone.patch/
> 
> This makes Samba public libldb as a public library, but from the main
> Samba build, so that the ldb build system is no longer used.

Fine by me.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



