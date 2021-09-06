Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B340182E
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 10:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=v24RZQt5Y+5O/ywR5wfSPWLIYSI1T6i9Uo9Y57CCFUs=; b=w22X0PItoUP5/DHP5DUfRziERP
	sSU5Z9S+uh9hhRJYzaD1MvYquDPXAVhY6eDIJ343ADssyPheFQA4LZuKtwJ7rDTfze1SZRzu2nUL7
	vXwq45aLItULRLvEB0aGxJ+c7uFNSgRFp/WluS05l/W2QcuMa4+M4O0GGGjVCyiGqGnc4Zvp+OBR3
	N3hdEy3qA3MNcfMzfm0TVyIfalc7H3PS8YbChDiwAPkyOUrtoxLQ4aHJjDhBs/Nt25vlGUwLcfLH/
	HAu/GGmkuD4jAZfQu6/FCq1y8/Q6Ji8rfGWcPkB2ITdUcLq4vY7fOXUfT1xfdx62ncmTY4EMka1av
	4tuf8E9Q==;
Received: from ip6-localhost ([::1]:33696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNAGj-00DSJI-Pf; Mon, 06 Sep 2021 08:46:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNAGX-00DSJ9-VB
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 08:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=v24RZQt5Y+5O/ywR5wfSPWLIYSI1T6i9Uo9Y57CCFUs=; b=kCW9PcSJ+OFg9I/QbBtFtAx1hN
 GOwqJTAKMPLUA1A2BiJ/Rx4LmsUMmLP1l5EGVla1k0W6RnRxsbA6wQq30tcGogU0hx0VuoatMPKX/
 4Gndrfsk+7dsnZKad8+9JDFioMCtjyXtJXJ4OP+LGkKEXJaGnSviZqJcP8fOESgw++A8qv4DNw1OE
 efwtQZUd5Mb3KtwjnZszGqROQoQlhEHhljXaG2qV9m26/7iMXu/4J/OyfeuVW4ltXIDRXOgm5hf09
 61AWJ/OZNKP23rDuCPHhrtBHJ4Rki7iKEegI+sy8FnaB8sEYYBHkBjM0/f+09iLTCT+FTWVqwacLn
 0/1idNTjEtjGaYuGtJvLnT8cC8EKL0YCbOJFTH8I9/sbiaw3fWEjkvZcGvgUO4FjmQprZTTmvY5KD
 of+XcEwhFCrYFvMXixbpse4We2aVb4W2qpmeveEAuR1+KDwSnYHQkn+xuLarQvGX+FeljmrM2KhuO
 s4iHjcmmzPBLjB+kCg5oaUnF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mNAGT-004s6a-9u; Mon, 06 Sep 2021 08:46:06 +0000
Message-ID: <6187378f7e3d9b62fa82fc1e3fd40f9ba2457e5a.camel@samba.org>
Subject: Re: OSS-fuzz needs some love
To: Uri Simchoni <uri@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Mon, 06 Sep 2021 20:46:02 +1200
In-Reply-To: <6be85ec4-b42a-7e0b-9aa0-1401b1644f27@samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
 <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
 <80f126c8d4b629f8dbf7e1583d6940e31934c458.camel@samba.org>
 <6be85ec4-b42a-7e0b-9aa0-1401b1644f27@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-09-06 at 11:42 +0300, Uri Simchoni wrote:
> On 9/6/21 11:33 AM, Andrew Bartlett wrote:
> > On Sat, 2021-09-04 at 13:30 +0300, Uri Simchoni via samba-technical
> > wrote:
> > > What I have so far is in
> > > https://gitlab.com/samba-team/samba/-/merge_requests/2152
> > > 
> > > I'll continue this in a few days hopefully.
> > > 
> > > One fuzzer, namely fuzz_parse_lpq_entry, doesn't pass check_build,
> > > whereas the others pass the check_build of oss-fuzz (at least in address
> > > sanitizer and libfuzzer mode). Our check_build.sh stops as soon as it
> > > reaches fuzz_parse_lpq_entry so IDK if it passes the rest (probably yes
> > > because of the oss-fuzz result).
> > > 
> > > The issue with fuzz_parse_lpq_entry seems to be that it references
> > > libtracker-data.so without RPATH.
> > 
> > Remember that the way the system copies in the libraries that are
> > 'needed' on the target is to use ldd.  If somehow the need for this
> > doesn't show up with ldd, it will be missed.
> > 
> > That might be due to our build rules or due to how libtracker-data.so
> > is brought in.  It also doesn't seem likely to be used by
> > fuzz_parse_lbq_entry so perhaps either the dependencies could be
> > trimmed or for fuzzing tracker support could be omitted (change the
> > configure options).
> > 
> > Thanks so much for giving this a go!
> > 
> > Andrew Bartlett
> > 
> 
> I thnk I got it - libtracker-sparkle-2.0.so.0 has a RUNPATH on 
> /usr/lib/x86_64-linux-gnu/tracker-2.0 - presumably to ensure it gets the 
> libtracker-data from the same build. Removing the RUNPATH (chrpath -d) 
> seems to do the trick, but I've yet to verify this full cycle.

One think oss-fuzz seems to do is teach far more than one ever really
wanted to know about ld behaviour and runtime library location.

Thanks so much for all the detective work, and for documenting your
findings so clearly!

Andrew Bartlett


-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



