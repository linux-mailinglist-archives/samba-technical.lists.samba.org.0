Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACB7F4575
	for <lists+samba-technical@lfdr.de>; Wed, 22 Nov 2023 13:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0lDDL4xH33w2Fs0bOmWyIwiHSJvJnz+onXWeOxCE6oM=; b=BhtZYHVEj4S13/VGm55U31XnEk
	J5VdIyYEr+TWgl1SYYwWxaFPLO1P4js4CM8fbzu5q3+0PnRLJsg9nySmcYBVP38SewbfEuRDTr1sN
	fyj/QG8Zb+yJv5AbFYv84rY1N99gqTzbCBBP//5mJvcHVLm6JBZxHobILbOiHpeuQYeNp09UK4NPU
	GOKKet45IwJAJS1Bd8ELnIKNUKIwE7AndqYTnG/op2gBl3hgbzwQh7cRSzeFD0JdmKK8WOFMmL8XW
	HlOJEK59r7+zGC4XRTV3/znyDF+B/NwDv4SnKDHM6epHTB1W5lIhDXaXhKOKew/Q5DFwSIk0MX4XX
	KT6ggQsA==;
Received: from ip6-localhost ([::1]:22534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r5m4L-009UfZ-OT; Wed, 22 Nov 2023 12:11:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61312) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r5m46-009UfJ-8L
 for samba-technical@lists.samba.org; Wed, 22 Nov 2023 12:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=0lDDL4xH33w2Fs0bOmWyIwiHSJvJnz+onXWeOxCE6oM=; b=a4WF8/7wGh8g+eJvaZc/51UOaS
 CBD/+5Qp+suU3l1mQ2J0EqUYtFKaP336jP9s/PExozleytTCBdQ3kr10QqsoAuJ3DzRL7Ob5PegaC
 4GQWPduSbojiNiUfzqgLmx21oM32FFalMiOGHLWrtTT6uJa8A9sDFY2wty0RRvKYaO0iXQIpOq01f
 nsoTmD+i4j9hl0AluNtOWqwFZHId5sXW1aPfcQsKEsxAV9i3S9RFs0hXcDFXT/qMICr8PnPDKq85S
 MpTJlmkzqcHY4ICjqw9atKTYNog8Bd6zTg0piXCkzgwS102r2uHPyZKM5mhX0OMnnpXXKpP6vjqY2
 dk/1KKzBgZjQ4AZ4vyvPIq/JJQeBkZvBj0SPTHGXQBY5ByxEpmEPxA/QRAr3HNZyVsS7IhZdk4atg
 jpqv7KWUYBlrPoSV1xfGpWTxecaMSblbI3BiTSQIRmcitjr7if5toYCm+042gb7rQ5H7uuVsHlGfY
 s3nxRvR/e6Jpv7V7Uf9AENRf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r5m3v-007aTu-3D; Wed, 22 Nov 2023 12:10:36 +0000
Message-ID: <db98d617-cd18-4c72-888a-35ffbb14566d@samba.org>
Date: Wed, 22 Nov 2023 13:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
 <2320390.ElGaqSPkdT@magrathea>
In-Reply-To: <2320390.ElGaqSPkdT@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 22.11.23 um 12:07 schrieb Andreas Schneider via samba-technical:
> On Thursday, 16 November 2023 07:08:59 CET Andrew Bartlett via samba-technical
> wrote:
>> For Group Managed service accounts, which we are working on, for
>> reasons around RODCs and a few other things, Microsoft has decided to
>> internally use a key-agreement between a 'root key' and a 'service
>> key', both held in AD.
>>
>> The password comes, as I understand it, from the key agreement derived
>> out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman exchanges.
>>
>> This is all in MS-GKDI, referenced from
>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/9cd2fc
>> 5e-7305-4fb8-b233-2a60bc3eec68
>>
>> I just wanted to check if there are particularly cryptographic
>> libraries we should consider for this work.
>>
>> In the past we have looked to libnettle when gnutls didn't provide the
>> functions we wanted, but that was backed out fairly fast as another
>> method was found (https://bugzilla.samba.org/show_bug.cgi?id=13276 0784
>> 4a9a13506b4ca9181cfde05d9e4170208f88).
>>
>> Even so, for this case is libnettle still the best first place to look?
> 
> If something is missing in GnuTLS you need, open tickets at GnuTLS. They are
> fairly quick implementing the stuff we need.

I think we should aim for having it in GnuTLS,
if it's not there yet, but it's in nettle, I guess we can use that
for now until our required gnutls version also got it.

The argument for bug 13276 was mostly, that we had the same crypto
already as an in-tree fallback, but that's not the case here.

BTW: for QUIC I'd look at https://github.com/ngtcp2/ngtcp2 which
comes with gnutls based glue.

metze


