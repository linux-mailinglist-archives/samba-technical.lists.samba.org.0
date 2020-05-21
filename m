Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC01DC68C
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 07:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=h0E1ZaoPHiC06lUNTY+PGXTfVfiu3A84N8MyzQcFUvc=; b=IPXFPRC1LgnbW7RK1LALdErP4M
	EZK5HUvV3GaYq4Um3AYrPwX18KAtRwW6rh8tKxfoqQmQQgnMzZO+Iuva8GWhF6NK/6NWGoaz9cM+4
	ex6g6fGu4mkNCJoxuM+CyfHKXA7AAFax9+liU0X1sH+Mw0CfCuC81tIE43sddMQgbcQh9AUB5zMsO
	0ilGAAytehSWIZN6r7Xf/GcZtaBNitdV2uxwAZrAXfghV2CEzN5yx90meIQhFp51GD5VKz4wISoXe
	eU5XKD/iV1q3MIC5ywES+5Z6aMntOaD5bMYK3TItDkDMzOssA/JRvKMvBPGSg1ImNzq/HvxXO4Hs6
	jmJwDTkg==;
Received: from localhost ([::1]:18952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbdaH-005KLx-Ur; Thu, 21 May 2020 05:17:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53930) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbda8-005KLp-1S
 for samba-technical@lists.samba.org; Thu, 21 May 2020 05:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=h0E1ZaoPHiC06lUNTY+PGXTfVfiu3A84N8MyzQcFUvc=; b=TmmzqSw89UUWZr5cXO80IjGldf
 lNrxz1gqH1JM+SZ+71nqwpAVEgYx5jSqWKtLWQN/6cBwC30KEYDpSS0554k6pe3lcfVKz8L+zK5At
 OVtH2xjdXi73W8ghEu40o+7V3mqxG1GnNVU/ZqThnlhzunpX6RV6Ye2B7ntVtn7qGoJCG/Jiejc2r
 tSITAZE/D+okb2/vG+KJUoNot0GkIRCqpT1+1zRYE/Feads7c4TPeRNMlaQbEI5z2RQRnACjAclRc
 MjDDP8tt/gQNJrsXOHaLwVVARde3QRgUb537ELvfXs6d5HKEdXdY2zl9AAbI+QRcUfNwTEh4Bc6+y
 j0b+tbSNsSGVq6KcoUKX5V4/c/o4pHW2PDjKn6WPz6cAfD8dTQf427M1K9iIARWAHhzVw9286Mqka
 XWfpXhwqxyCy6V89QGPk/AyDpL1V09OFj0An9tn+KIWSDEo9x76HcPx1vfwIODp86LEXbGBtpN6mV
 T2m3qYul7vxRWXsEpgJs3R7A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbda5-0000um-Lu; Thu, 21 May 2020 05:17:21 +0000
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
Message-ID: <530356a1-a074-9cc8-ddf2-92a79b98dae8@samba.org>
Date: Thu, 21 May 2020 08:17:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: swen@linux.ibm.com, cs@samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Does LDB (as client) have the full AD integration (Kerberos, sasl
wrapping)? IIRC Only libads had that and then in 2015 the mentioned
winbindd change added that to tldap.

Protocol-wise, ldb coveres more than tldap (vlv control to name one
example).

On 5/21/20 2:47 AM, Andrew Bartlett via samba-technical wrote:
> G'Day Sswen and Christian,
> 
> As this is a more 'meta' question, I wanted to write to the broader
> mailing list in regard to: 
> https://gitlab.com/samba-team/samba/-/merge_requests/1351#note_346327256
> which is following on from Jermey's comment: https://gitlab.com/samba-team/samba/-/merge_requests/1258#note_320352109
> 
> I'm really sorry this discussion has come up on what might, in other
> circumstances been a great demonstration of showing the broader design
> that started the tldap changes.
> 
> Jermey asked earlier to see the broader designs and given the broader
> implications I think it is appropriate to have that raised on the list
> here.  
> 
> Explaining our plans in public before we have code is not something we
> do well in Samba - we fear (and this mail shows that is a genuine fear)
> that others will jump in and suggest things.  Much easier to have the
> code finished and put any questions to bed with: well, this is written
> and works!
> 
> However, I quite strongly feel that we should not further proliferate
> the new or substantial new use of tldap in Samba without:
>  - offsetting work to reduce, not increase the number of LDAP protocol
> stacks
> and
>  - substantial sharing of structures, ASN.1 parsing and other utility
> code
> 
> My preference, as these are all sync or local callback based calls is
> that you implement this with LDB.  LDB is a mature, extensively used
> LDAP client library (not just the directory store for the AD DC).  
> 
> The routines you would need are ldb_search() and ldb_request().  The
> timeout can be easily set on each request and I can assist with further
> guidance if need be.
> 
> It might be that LDB as a whole is not suitable.  If so then I would
> ask you instead implement other offsetting measures between all our
> LDAP client libs.
> 
> We have seen in many other areas of Samba the incredible cost of code
> duplication.  The efforts needed to merge the s3 and s4 RPC stacks has
> been monumental.  The gap between the s3 and s4 loadparm systems
> continues to create headaches that make it significantly harder than it
> should be to just select and use the best of Samba's library code!
> 
> We have also seen this done well, where the new better API is
> introduced on the basis that it also provide an emulation for and often
> eventual elimination of the old API.  As examples:
>  - Andreas introduced a new set of macros (PULL_LE_U32 et al) for
> reading and writing integers, and the old macros (SIVALX et al) use
> those.  The NDR callers have already been converted.
>  - The python3 comparability API was introduced for the py2/py3
> transition and is now almost totally removed.
>  - gensec wrapped the old source3 authentication code first as a 'no
> change' and then slowly the parts under it were merged.
>  - the datagram messaging system is now common, underpinning both
> messaging APIs.
> 
> You might ask why I didn't make this comment in 2015 when the idmap_ad
> code was written, and why that prior art isn't a good enough guide?
> 
> I'll just say that the history of LDB in the Samba Team has been
> fraught, and it would not have been wise of me to make a criticism to
> those involved, at that time.
> 
> But I must raise this now, before we end up with three fully-fledged
> LDAP client stacks in Samba!
> 
> Andrew Bartlett
> 


