Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E02C3A4
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2019 11:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MnkxKlcTxcCZ9oqu2JgupH7FlZHJOasWYm7Dg7/szac=; b=nadT+HN9x9DOh3T9CmF0qO7dBH
	usy14+Q9HJVz345358ohyxgILNRB/yvWMFx2Zm95oCbCnMINqGZm+ZnXeD1gOKhPFYqdNnoSFF3Le
	+TL1Z39odJxzkt83pFkb8bdf0LcVPp9WzzarQ+fKqb9mlqEQk3G0pBCuuuf+FA9TZs6BCqraiP8+C
	dQBUlL/AkNmEh4a3oQNpf3X28z2j7pJ23ivYMa6spYyUNR20FWTXp3UC9APglZa+fXpiDUhNN0AHi
	m7q77dP7nKdRjUwPqVDnTgDrhE0vVsS0QCkHCUXaN2QA9ptj4JsGRj/ukItofH5Ns6n37YI8Whr27
	cQgUSDDQ==;
Received: from localhost ([::1]:18836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVYqj-002K0H-Tm; Tue, 28 May 2019 09:56:54 +0000
Received: from [2a01:4f8:192:486::147:1] (port=29418 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVYqd-002K0A-Rg
 for samba-technical@lists.samba.org; Tue, 28 May 2019 09:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=MnkxKlcTxcCZ9oqu2JgupH7FlZHJOasWYm7Dg7/szac=; b=ivwyoAWxKwYiKpzUnB9ENI3OJ1
 9JLauIyZDOHYD/aq1uLicQJOaDnTzsic/G5tYH+1AphhZ9IcjuL2tSK/N/0P32axAccZDNEp0kvBg
 pmNT3pxssUcRdXrRAdoIsZRZxLM/OI4s+pRg11BQEA5aYzQUfd/Dp+K6DsYm1nLOUvLU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVYqY-0006lJ-In; Tue, 28 May 2019 09:56:42 +0000
Date: Tue, 28 May 2019 11:56:40 +0200
To: Amit Kumar <amitkuma@redhat.com>
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
Message-ID: <20190528095640.fcn2gm5gb62qoqel@inti>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 28, 2019 at 12:47:05PM +0530, Amit Kumar wrote:
>Created merge request:
>https://gitlab.com/amitkuma/samba/commit/1a6f331445364de623d02425c8d8b46a59eb2c53

Thanks! Unfortunately you targetted the wrong repo (samba-team/devel/samba 
instead of samba-team/samba).

Please follow the instructions at
<https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Other_Samba_developers>

>
>Attached patch as well.
>(0001-s3-winbind-Not-abort-when-received-NULL-SID.patch)

you're somehow munging the patches, replacing tabs for spaces, that's why the 
patch again doesn't apply.

Looking at the patch, I wonder whether we should skip the trusts with null-sid 
instead of adding them?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

