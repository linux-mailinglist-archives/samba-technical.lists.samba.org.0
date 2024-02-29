Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B19A586D484
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 21:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=IS5vutZL4xHcCFXmr9Qtcdg3OYv/Pnxvy1BuJ3aQAFg=; b=qepocZL0L3yIWeJc6U9alilv3z
	Y5S4yJ8/VNwTQemXc1ZKFjqrssWJOANKKcb+m89/cqs86yq98Tj+RLm1IACgzrqa485l9y9veiupF
	69Zn7NuqbKc/GMZRXMvKeab8pNVoIsX5Iug4ntPj0IIWlSS1ujV9a3fLIW5aDRCHvFvHxGq57xa4v
	MFbahO7/XlrVsreYIbiRPotsVmUQflN9CYhgLyNRmtwyJEpLzUe2J8P7UZeBu98yeRbZmvLK2w+kh
	UUzVzA9NiyWnUlPDQeyWRWPkIdhYdfiqqx0oEaD51dP8B821AAr1Xh3T2qJJFT2y1zSus3FhjVV0U
	adlbl/xQ==;
Received: from ip6-localhost ([::1]:32906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfnDj-009jex-Kt; Thu, 29 Feb 2024 20:41:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48368) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfnDf-009jep-0X
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 20:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=QyUKxUJjWJ/01TQEATGhPjuAR8HuyZgmIMAAidBSAp4=; b=kNlTP5jYGmvNZ4CoxtQjw+47uT
 uChXPUN4B6v9A1nMijcEC1I0kKS3hmmn2+NsNHuOQLYyknKly1DCqZVE/yT3fzdfCyj5eIi/r9KEu
 qGl5idm9yAgHdYObhDARz3Fv+pEQdcRI+mX5Bx2Kd4oY/XbZXW03a8aYHN8vR07HdAKnMW6SP//WN
 tv8nI/+kKKyOSgpPrshspFtCJHElksfnVCA97jbfoGhlGPHecdu2MXK5F71Q46VXTbZkcHm6Y9bQk
 Wb4cAg9ZvqjCrzGwBvE+zxQEgGub6pycpiG7LG35z0VfUDWHBfaPvUDPlBWn+cN1yDEsw5GpnIFh3
 v8iVTa5+VQO1SJr212Jr6M+I2WX9R0wpwbdXR6ng7Tz7/Ryj12BXtBU0QbPhVWd8kXtaOUUlFhFAl
 SGivPKFUaCIn2D3ROVBVQFUU68bn+1s0HSWDU3CpfT8DtKXjw5mBBUgtIXaH/jc4X8knUT8Uqf0QP
 AcnsqrWZBJIXJD8Q4hZe3UJJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfnDd-00FV1x-2D; Thu, 29 Feb 2024 20:41:30 +0000
Message-ID: <ba174768cd7099d45ea9ea33842845be7d69cac9.camel@samba.org>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
To: Nico Kadel-Garcia <nkadel@gmail.com>
Date: Fri, 01 Mar 2024 09:41:26 +1300
In-Reply-To: <CAOCN9ry_QhZ6ZvUMpx7mzLgjdLFBeX1-1=CmbCsBSDKadnRaYQ@mail.gmail.com>
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
 <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
 <Zd2jaaIxgSWMiZ6f@toolbox>
 <CAOCN9rz3nPyzGyyZVHAydFxaO0wDstMnDSZUttYs6D+c4VXk3w@mail.gmail.com>
 <6b86a32e36a815cd2394e05600d963262601f7c1.camel@samba.org>
 <CAOCN9ry_QhZ6ZvUMpx7mzLgjdLFBeX1-1=CmbCsBSDKadnRaYQ@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

So glad to have helped, and very appreciative of your work.
Andrew,
On Thu, 2024-02-29 at 08:41 -0500, Nico Kadel-Garcia wrote:
> It's a *veru good* red herring! It helped show me where the dang
> sharkwas gobbling all the little fishies. Namely the latest
> samba.spec fromthe Fedora published SRPM for samba delete the heimdal
> directory, "toensure the use of gnutls".
> Bad Red Hat! No biscuit!
> It's compiling successfully now. though it still requires tuning
> forslightly different files in the RPM. Thank you for the pointer..
> 
> On Wed, Feb 28, 2024 at 10:10 PM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > I think this is a red herring.  The files did move, but so did the
> > heimdal_build directory that references them.
> > Andrew,
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



