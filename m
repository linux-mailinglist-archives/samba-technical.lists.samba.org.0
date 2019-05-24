Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084429E41
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 20:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HDS0bxuz6hrSBkXQn7BRbO+N9WzGQCkXSgHiZNyGtQ8=; b=YvtKFViCOFFoF/XXJL2W9sZ4rz
	u5ggg/HHDHDX9zhO8NPitFgbRgq9yjWdreknQVuVI0XNLFeRgYbs/1rOAHRFqmzP3bf+dJ6IIYWmk
	wF9eSNeWlAHqkstSO7nasw7VFNlkNIpVSbMnVSKDV6lKzPIu8MKp/ZaRbXAtEgA6AM4FGTuiurLRK
	/0RdcR0OLoNKdUzBJw0kT7uB0A9IrVOMBLZCyVFLNQnqcVTEdnNDVClI9gSjNdhDbuiwMRBZZi3Nj
	uuq1qhHMBASZs6mWVq9g4uk1spcS8r47BjTtiEMfDt44CJVpAlj11zu5+fAgiaTRHaAPW2960MWiW
	uGglR8Mw==;
Received: from localhost ([::1]:29090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUF8T-001deF-U2; Fri, 24 May 2019 18:41:45 +0000
Received: from [2a01:4f8:192:486::147:1] (port=11652 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUF8Q-001de8-C1
 for samba-technical@lists.samba.org; Fri, 24 May 2019 18:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=HDS0bxuz6hrSBkXQn7BRbO+N9WzGQCkXSgHiZNyGtQ8=; b=Dq138v8is1RRL0kLgK6ZWpZrZK
 Rzg2T1WAV2DOKV0W0zplpq1xtTTf7X3AydVL91BHTOOUcBkVym3rxRgazkqQ0TyRW8OpM9mhk1T9x
 y2lQNy0tWhPKE5STgy64hox9aC/fcKKcFTdz/dc1HVdp70wrLuU1X/hNtVKdMb6ej080=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUF8K-0003hP-H8; Fri, 24 May 2019 18:41:36 +0000
Subject: Re: Kerberos and Samba client tools
To: Steve French <smfrench@gmail.com>, Andreas Schneider <asn@samba.org>
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
 <2585169.WRIv5fHKiD@krikkit>
 <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
Openpgp: preference=signencrypt
Message-ID: <e8c0e748-d361-4cd8-485d-81a38d4e01db@samba.org>
Date: Fri, 24 May 2019 21:41:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 5/24/19 8:30 PM, Steve French via samba-technical wrote:
> A related question (to your "--user-kerberos=yes" (or auto) is "which
> ticket will it use" and "can you get a ticket on the fly by specifying
> this with userid and password" and can you override which users ticket
> will be used in SMB3 session setup?
> 

I know we can have (on smbclient and on "net ads join" at least) a
combination of -k and -U which means "do a kinit, store the TGT in a
memory credentials cache and use that to obtain a service ticket". I'm
also familiar with -P which takes the "user" and password from the
machine account secrets store.

I have less experience with the other modes (using "my" credentials, or
some user's credentials, from a system-provided credentials cache,
there's also the option of winbindd-cached credentials), and how the
various command-line parameters decide which method to use. Presumably
-k alone takes "my" credentials, but does -kU allow searching for a TGT
for <user> in "my" the system-provided credentials cache?

Thanks,
Uri

