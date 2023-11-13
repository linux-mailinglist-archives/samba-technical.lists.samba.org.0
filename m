Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 375097EA3AA
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 20:21:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=KUVQ6Rx6B/vfeJwhzXxCvAxj4lKVmmSI8kLhYZ7jXwY=; b=j2uFtidOboV3eB9rQILVoRApgT
	jd74TdzIlw2yjRBTX8KsyW3H1nWAXskcgvey9KWja0jD2Srqh3xZpBjF3HIASPtlhj/tRwgVHkbWP
	Wmdb24CFA9CEkpPL+EF1XyNj2XKFOWZrKjxz/YmU2guTgqh5aulXjzLzlOnXVd3iXxQCcSjdSyUeP
	X5aSbxpcvtPZGu3ewO4lpTRqrnd8fOeVT2ZYbAbM7sJBLjRTmlzmVS9oMfi1DHzC6dzROTqipuFiT
	Esu74UR0LpHFgfUEBgbGs9YjLqt3ebxcPSpgInGzgzjNwWBbRdfcSQtgAmfYOM213AxmYKqBe6gGB
	qvsdW5eg==;
Received: from ip6-localhost ([::1]:20058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2cUy-0088yS-J4; Mon, 13 Nov 2023 19:21:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2cUr-0088yJ-9S
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 19:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=KSBa9OsGrJ78zLxn6BKbENvPSI1kFpvQ6dWoA7WVHTs=; b=3CYmd+1G53EIgG/fBGT7DfuAHT
 HuNbMv6RjAtmImXms1JMardr80gPc67ne/qLy6qQYhGWX0b2MFTV9D3b9cs8GRPFiQgwYAxTbi+Iy
 N6KeKroZv+l9HG5hDb1AJElPEoNUR/U2D/QFEZ4pWeESxOKA4RDaORBxpMQgC1FjkCof1MicGvdBl
 4fbMDQm5feViBcSkN8sAb4YFTdMIO1UBO/aACWqpMjIrfqRfm7Gg4fEoA1WTPm2om5v8k+W2S1bdN
 uPZ5eY2kcF0CebPvpj5QXniZnWKC7HyOPqRsk3Roj8oaxxtIxb8w3m9ElL3suzt0gsbY6R0qGTdvz
 X4t42zpxakixJ5N+KITBX4w5SsaC0wjoF2AHNX8ZwcAuVzphV6HB2AlGV1p0WiThIy7NLU3RspzKc
 PG55TJEBu37rAALLZPIneEMVXMeRPPXze2QxsELgZS8bNL3s8z2aRm8z02I8Y7xIgCG/DbCDFmB4r
 Lsfl3FW+bJ/czAKLhJQBfRa/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2cUp-005yka-2S; Mon, 13 Nov 2023 19:21:20 +0000
Message-ID: <e3acb2b471a5400da1b975d7a221cc59445190ba.camel@samba.org>
Subject: Re: rust in Samba (for certificate auto-enrolment)
To: David Mulder <dmulder@samba.org>, samba-technical@lists.samba.org
Date: Tue, 14 Nov 2023 08:21:16 +1300
In-Reply-To: <dc587b8f-72c1-3437-2184-4a8e0200b73b@samba.org>
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
 <4161642b58cc7840c73c91cdb000716b423593db.camel@samba.org>
 <dc587b8f-72c1-3437-2184-4a8e0200b73b@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Mon, 2023-11-13 at 12:04 -0700, David Mulder via samba-technical
wrote:
> On 11/13/23 11:42 AM, Andrew Bartlett via samba-technical wrote:
> > On Mon, 2023-11-13 at 15:28 +0100, Ralph Boehme via samba-
> > technicalwrote:
> > > On 11/13/23 14:56, David Mulder via samba-technical wrote:
> > > > I'd additionally like to be able to contribute rust code to
> > > > Samba,andI'm certainly glad to see someone wanting to work on
> > > > certificateautoenrollment. I know there is some opposition to
> > > > providing rust codeinSamba, I think because of platform
> > > > support.
> > > iirc this was about AIX for which we do provide our SAMBA+
> > > packages,butlast time I checked several months ago AIX support
> > > was about to bereleased in rust, so this is likely not an issue
> > > anymore.
> > I would love to see some ways to start trying rust in Samba.  We
> > willonly really know how we feel about it once we actually start
> > using itin anger, and our packagers start trying to package the
> > result etc.
> > Things that don't touch the core file server offering are clearly
> > goingto be the easiest targets, while we start to understand what
> > workingwith rust will means for Samba.
> > So I think this is an ideal place to start.
> > Python was in the same boat for a while, and so there is a
> > --without-python build we test that only uses python for thebuild,
> > but produces no python requirements in a bare fileserver.
> > That helped us get over the line.
> I've also thought of writing some AAD/Entra ID stuff in Rust for
> Samba.

Yeah, and I think that is also ideal.  It is much less problematic if
new features, rather than existing functionality, has additional
requirements.
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
