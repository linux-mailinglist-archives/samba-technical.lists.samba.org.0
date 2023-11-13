Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 781537EA304
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 19:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Y88bm014jyiVBIcVcx3XfUL8dMMejZsLbLFZVLTipN4=; b=zDsZXizucrynlWScvHOo2FDB9z
	sN2Ep1lVJsFaYK3fnUiHgbEbPcTa2PSyQJWB376lNMx9MTPQRbkrPAGIOxzjcdpqSrj2Dwx4nJYtQ
	JPCoVdX+CYfjCnwKZfaJXHtrsKQAQ4sCr9GCHwm2fip4nWNAngaOSq415TzShVQB+QwUvsbBIMTxg
	q/3lFNWHxbBt56tUduN2/0f2TiolJbJSzVsmcwHwdnp2mOzsM9ma+u/+F5lmy3rzZPU/PZ0xOkwe5
	OlFHmoyVQZD1smUFNSmi9ZpucbQfsmUlyp1wF2Dw0xqFPsK5W6fB8HkYEfzN49ng/4mi80UKOEqAl
	0MLqWl4g==;
Received: from ip6-localhost ([::1]:56424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2btk-00886n-3E; Mon, 13 Nov 2023 18:43:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48278) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2btf-00886e-4B
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 18:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Y88bm014jyiVBIcVcx3XfUL8dMMejZsLbLFZVLTipN4=; b=d2folSjVoNDUYFFei/wii/kxcj
 Wj61OvPmudqx9QSKYCaVT1rFa9Q8FxB3Cb814KA7C3+LWiN0kqMV/wxJDMSmpD1vzXT5nO1o9lZXk
 ojepFrvKkWYgCns13Evm0mbcvKsl7JL+PMjStf3rh/1zdJvGDNqsqX4AbNha2/8NHtTpjSy6HXGrL
 RqSM9MwZNtQ14024PLd1/j+SJdAR7V9PhhQq5SoyVo5a6aY5d4FwM85GcO8AVYMrCbddqPuSJVP87
 JF0KppzfMr3a/2Tuw0KUlYAtsxR9NYJaxKHhwmTPp8tfY3Uj/FRJIsvUVUXG39BMU3q6b8KzUjhLy
 VARpmz3c5Avv35fixDDJx4RxaMqhtbTkiyfpQhUlgvu/1/tSmdZAvf+sZVGIF/b5pGNe++o4J2Ym2
 GCjXZ2+TLYNnr7I72rAXo26EbOhWHLKKtY5Sztejv74XvAqqjOIqdm+C11MP5+SPvaZxoSF1shhcI
 c0KPo/u3HLoP5Y491NWZDRYv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2btc-005yIk-2p; Mon, 13 Nov 2023 18:42:53 +0000
Message-ID: <4161642b58cc7840c73c91cdb000716b423593db.camel@samba.org>
Subject: rust in Samba (for certificate auto-enrolment)
To: Ralph Boehme <slow@samba.org>, David Mulder <dmulder@samba.org>, 
 samba-technical@lists.samba.org
Date: Tue, 14 Nov 2023 07:42:46 +1300
In-Reply-To: <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-11-13 at 15:28 +0100, Ralph Boehme via samba-technical
wrote:
> On 11/13/23 14:56, David Mulder via samba-technical wrote:
> > I'd additionally like to be able to contribute rust code to Samba,
> > and 
> > I'm certainly glad to see someone wanting to work on certificate
> > auto 
> > enrollment. I know there is some opposition to providing rust code
> > in 
> > Samba, I think because of platform support.
> 
> iirc this was about AIX for which we do provide our SAMBA+ packages,
> but 
> last time I checked several months ago AIX support was about to be 
> released in rust, so this is likely not an issue anymore.

I would love to see some ways to start trying rust in Samba.  We will
only really know how we feel about it once we actually start using it
in anger, and our packagers start trying to package the result etc.

Things that don't touch the core file server offering are clearly going
to be the easiest targets, while we start to understand what working
with rust will means for Samba.

So I think this is an ideal place to start.  

Python was in the same boat for a while, and so there is a 
--without-python build we test that only uses python for the 
build, but produces no python requirements in a bare fileserver.  

That helped us get over the line.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


