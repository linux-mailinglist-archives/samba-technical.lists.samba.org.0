Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEAA7F0420
	for <lists+samba-technical@lfdr.de>; Sun, 19 Nov 2023 03:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4k8B78fmlXtEYmfBxNhKEsnMaWrnF1wBB8ISyZTChsw=; b=F0Lkl8zRcyBD1zlZAvYBcg8xnP
	ztOWjFS8Y5ZTbPr2RmgUydHt3/i/LSs9Sz1bAg65BDWLLDqhqJMtZmTEVLv9NLiSbbEP7B1CysEkc
	qXX8LiaysoilZXiEbPoKaySJaVr3u/3VYetODCHvb8rdGgziCD8sFOO1AkLsXBmkqv9ZFt4bla+eu
	67Sa8QRyfeJX7c9vJU/rIC9vaOLfkqwe/mq2kJXt4s4+n2EGJECHS/bJzvFEHnuwbFvIOwBSJcfWz
	i4XCR87PsE+qqVRw5FpIRN+NRHp5kZWZGTlclOtw3n9WylfzuT2B1iDsJXkVyuTE4p8Ogr/eEpN++
	YgD+vWuQ==;
Received: from ip6-localhost ([::1]:62346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r4Xxk-008rcG-GL; Sun, 19 Nov 2023 02:55:08 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40585) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r4Xxc-008rc2-5s
 for samba-technical@lists.samba.org; Sun, 19 Nov 2023 02:55:04 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A0BFF32004ED
 for <samba-technical@lists.samba.org>; Sat, 18 Nov 2023 21:54:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute2.internal (MEProxy); Sat, 18 Nov 2023 21:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outurnate.com;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1700362491; x=1700448891; bh=4k
 8B78fmlXtEYmfBxNhKEsnMaWrnF1wBB8ISyZTChsw=; b=s+TZ2buRgHijOnLG2z
 wLqAFUd/byzqxEhJDGZvny2yZuOvURXDwu0XB18syXPWV0vyoS4ceOY4OGQLR7TS
 wJXFx4DorkN6Pawfy8+7pSZBOkVWwADhhM6Y/Bd9puULoL6vhKbpCrBdOKIadSF4
 HN8ne6FFMkpOxSwK3dSj3TfZO1OP6bPCiaFKKzRQjyYbQvY52t841AJ05zzdI0yD
 a2mv1e8rL2RypxDyoEv/DXnfHymtfIxOSOHc90eQ4EKauTWApZRGu6JZraN5Kwuj
 ptvJbMnqE9xOnZn88tft2iWjHjp0K4XCnlbUf2S9oqL8eJZZndCcthoSrvX1BCc0
 6/0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1700362491; x=1700448891; bh=4k8B78fmlXtEY
 mfBxNhKEsnMaWrnF1wBB8ISyZTChsw=; b=WY3cYOlboEf7b6TTEcH+4WiLMHI6F
 6YD7gborh5Wj9oGObxc6lp7P2ju2A/s/K5mZ1wRSMbUrD+xPezmSnpFmQhkszjay
 /hNUdFP3CSmrEgRT/komyFv6FwFgZP1laTOyaZ98Qbp9gOKcO1ZGwLtWIpG1Liim
 GLuVJA2mb+25WBqcjbzJgM7uchJ+Rml31GMRYmQqgsJrkEeU+lc11bMf9ZxESH2Q
 RmaEFh/uribz/nN56BIjahgUagwVb3FsHe5CI/dhfve/YV9bDPw3vMklgT6q/YEU
 B2o4Yjva9I7laHNgvNz9DQ3ZWQD+sdRanmSb2hYoC1XiqLBfnBOcC4IJQ==
X-ME-Sender: <xms:-nhZZb4TD-y-YtFuYUsBiYU1kZFg97KGf4tRnNtsQbjCRLP7ofvh1Q>
 <xme:-nhZZQ44Rk2sWeosNNwNdjL0vQNcVSn_kq2y1NJ758f0jDAUnF_2a-eceXYvBBOP9
 19cWoSGCP9904wfQ0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegfedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedflfhovgcuffhilhhlohhnfdcuoehjohhsvghphhesohhu
 thhurhhnrghtvgdrtghomheqnecuggftrfgrthhtvghrnhephfejleeivdetkeegieehke
 ejvdekfeeludetteefvdeuveekgefhieehhfeftedtnecuffhomhgrihhnpehgihhthhhu
 sgdrtghomhdpghhithhlrggsrdgtohhmpdhsuhhsvgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhsvghphhesohhuthhurhhn
 rghtvgdrtghomh
X-ME-Proxy: <xmx:-nhZZSfKisXrNSjfTi8b4a5vNVygq16NTWmuDAKNNu32KDVkU4Wa5A>
 <xmx:-nhZZcKIjkBVI7y-6z28ecspIweNvTJaLf31WyEL9zuRPVT2CNajvg>
 <xmx:-nhZZfJKqhbDqlUtFyY0trdjXG83RG_R6KIqoelmtfGMI2Gysb9a8w>
 <xmx:-3hZZUX4-jNOIgkE-wyjInz8AS5d8mtgmI02RsgUmL-dAXaKGg_LEA>
Feedback-ID: ic7c14608:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D589EB60089; Sat, 18 Nov 2023 21:54:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <371d142b-32dc-44ec-a677-39d26ba96f0d@app.fastmail.com>
In-Reply-To: <66505624-8efa-843d-ede0-8968d2951f59@samba.org>
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
 <4baa6aa2-052f-1e19-63c0-ef3711d9febd@samba.org>
 <7b96929d-54f6-4e2f-8180-2810d7b6ae10@app.fastmail.com>
 <66505624-8efa-843d-ede0-8968d2951f59@samba.org>
Date: Sat, 18 Nov 2023 21:54:30 -0500
To: samba-technical@lists.samba.org
Subject: Re: I want to make ADCS support better and I need some advice
Content-Type: text/plain
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
From: Joe Dillon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Dillon <joseph@outurnate.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 15, 2023, at 2:41 PM, David Mulder via samba-technical wrote:
> 
> On 11/13/23 2:53 PM, Joe Dillon via samba-technical wrote:
> > AIX support is a tier-3 target in rust: https://github.com/rust-lang/compiler-team/issues/553.  Samba already depends dev-depends on rust (selftest requires python3-cryptography).  What's usually a showstopper for rust is gcc support.
> >
> > In my opinion, it makes the most sense to not re-invent the wheel though.  I had to write a Certificate Management over CMS implementation in rust because one didn't exist.  Python has python-cmc.  Would pulling in a dependency on python-asn1crypto be acceptable?  As I understand the source, the samba python module doesn't pull in any dependencies right now?
> >
> > Am I correct that the modules samba.dcerpc and ldb are currently undocumented?
> 
> I've hacked up a way to build Rust via WAF here: 
> https://gitlab.com/samba-team/samba/-/merge_requests/3394
> 
> This is ugly right now. There is probably a better way to do this. I 
> don't understand WAF well enough to make sensible changes here.
> 
> -- 
> David Mulder
> Labs Software Engineer, Samba
> SUSE
> 1221 S Valley Grove Way, Suite 500
> Pleasant Grove, UT 84062
> (P)+1 385.208.2989
> dmulder@suse.com
> http://www.suse.com

I managed to get the IDL for ICPR translated to PIDL.  Would appreciate some feedback on the IDL, in particular, on the dwFlags struct.  It has 8 bits of padding at the end and I wasn't able to discern what the convention is for reserved/padding bits in structs.  See here: https://gitlab.com/Outurnate/samba/-/commit/e7520d74583b0fb3cfeac0783ae741f197f8eb99#note_1657603227

Right now, certificate enrollment relies on python-cryptography, which has rust components.  It uses the asn1 crate - my CMC implementation in rust uses the bcder crate, because that's what the CMS crate uses.  Design-wise, I have a few options, and I'm seeking some guidance here:

1) Pull a new dependency on python-cmc and by extension asn1crypto.  This will bring the number of asn1 parser libraries in samba to four (that I can count) - samba's asn1 lib, pyasn1 used in the test suite, and rust's asn1 crate.
2) Write a new, minimal CMS and CMC implementation in rust on top of the asn1 crate, thus introducing no new dependencies.  This implementation would then be exposed to python to be combined with cepces and ldb to form a complete implementation.
3) Have ICPR be the only in-tree component of this.  Shunt the rest of the implementation off to a certmonger helper binary.  This was my original design concept.  There would be a slight circular dependency - the helper would be dylinked to samba, then python would shell out to it during enrollment (like cepces).

Any direction is appreciate

Joe Dillon

