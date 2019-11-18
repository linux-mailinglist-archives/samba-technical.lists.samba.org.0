Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C79621007F2
	for <lists+samba-technical@lfdr.de>; Mon, 18 Nov 2019 16:14:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=h8d3QhnEK28SKFqDIP5r6xARowvGAthGkVGRHitnqCs=; b=gvAns7Tnq9z3RZRmeRLLpyWaK6
	Et6+/HgkuH5DQC42lD07OAIKWhTHfRW4XaQpl8ZoKGPkVbxpBfvN2QPSXW6Vn0n6P55PRmuLpnPQ2
	NXMlikoGVU/Q3D3zjOLnBR/PJW3ofzK8e+aY1AEnM7jHggLXGoCLDYb4OzYnsnljmMeArKp4v0ctz
	pd83UinCXXA5LWjH+rYhcTq9L7hepjO8NTzTo8P11x74NnSXNH1tLptAvRzWRNACBMC5k9sX+f4yu
	v+iyCOuKo8v1xSiM/twfOThyWFn78bP1jp6RVlhnCnyo/B0oKStPU0nZtsNrUo3snL++JjJCM9GEn
	peEPApxw==;
Received: from localhost ([::1]:49514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iWija-001Ysw-6X; Mon, 18 Nov 2019 15:14:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43170) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWijV-001Ysp-V8
 for samba-technical@lists.samba.org; Mon, 18 Nov 2019 15:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=h8d3QhnEK28SKFqDIP5r6xARowvGAthGkVGRHitnqCs=; b=DIookQkyLBK5fUW/oSf/fAYxFd
 a6Jo/7637k33nHs+iCwnvv6l1U6/7VMdWzSwFNWcI68hP2ih4zsxBHds4DlIaGoBn+r5C7sCZYE1i
 YR8nk2j9U8rNR+FsucB0BkuHmSOFjC2mGkpVX4PJV3sS7OyP86CEJE4kJI+yfRWudzL+yJmr3gAeX
 6/Lli+5B1Q+2cRR4AKtzJV5tPV0I2AtNTyjbcPhFcYJQgEWucHg1w8BPErHAAOyFI/Zk6PAB8Qb2Z
 ZNhoMVs/b3ECFwi6GS35pSCrs/Xdt/nDvtK/thq7gkG3Hk+YfIi/C8sfUbehUHSt+RHgJzEskULVf
 PY69HJQFfMNwrqUKj0zLM2UGRxArhp+uP2HTerec+l+K9yaeiVSdwpdUuKwTBV0IRAr6s0Psfwvlc
 0Ua7+l1FA9xuD/qtv1OMdsA7YcUzwK2Vmv8rYKQr/M0N7zNPkos5JVkxh+H2fMj6aN/kDaqxDjlf2
 nAsFzcikypyPnXZbxeA/d0EN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWijT-0002dx-0L; Mon, 18 Nov 2019 15:14:27 +0000
To: samba-technical@lists.samba.org, Uri Simchoni <uri@samba.org>
Subject: Re: library versioning
Date: Mon, 18 Nov 2019 16:14:26 +0100
Message-ID: <2512664.fcuHY9721d@magrathea>
In-Reply-To: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
References: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 18 November 2019 14:38:06 CET Uri Simchoni via samba-technical 
wrote:
> (taking the thread of https://bugzilla.samba.org/show_bug.cgi?id=13846
> to the list)
> 
> Hi,

Hi,
 
> Can someone reiterate our versioning scheme for libraries? I'm a bit
> confused because there seem to be some contradictions.

our versioning system pretty much broken. The version number is also the ABI 
version number, but ABI versioning works differently.

See also https://github.com/ansasaki/abimap

> - v4-11 branch has talloc v2.2.0 and master has v2.3.0 (additions to ABI
> - 2.3.0 was released without a Samba version that uses it)
> - Due to a bugfix, master goes to talloc 2.3.1 and Metze suggests that
> v4-11 should also go to 2.3.1 (and I remember that indeed this is the
> way it used to work)
> 
> Now trying to apply same logic to ldb:
> - v4-11 branch has ldb v2.0.7 and master has unreleased v2.1.0
> (additions to ABI)
> - In the same way, I suppose that we need to release ldb 2.1.0 and
> upgrade v4-11's ldb to 2.1.0. But in ldb, we have 2.0.6 and 2.0.7 which
> are bugfix versions off v4-11 branch - why did we publish bugfix
> versions off v4-11 instead of releasing 2.1.x and moving v4-11 to use that?

libldb has a database version or layout version. That layout was stable for a 
long time but then changed. So we have incompatible versions because of the 
different layout. However you can't really see that from the version number.

I think berkley does this by adding a DB version number to the name

DB4-5.1.0


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



