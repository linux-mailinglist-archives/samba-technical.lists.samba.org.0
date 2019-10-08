Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BFCF679
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 11:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=37QZa7G8FuhZe1z2ZF7RpnHJefj+oQ0iwWWwCf0R5O4=; b=z2xdnwqyAOPY1T2aom+EHfQwS8
	raYL1cp4C5FHSBm1EgjBSeqBkWQ3IGmAUOn8Zw4DXNiT3D7jh8EeONnk6DLqRpUPMpQAvFw97gWOE
	Go3BEEdhhuuxaEqYlXmY96VZe2qjqLQk6kWHDLnWbmSxcxqiWC2NxbT6sNAooBNZttQG4NrCDqZrf
	Rr10g/V7FPnE5EUvRdl9SkY4Deqt5ykFi4z5I2ePKZi0NH506gzfgk/dNQZE5hH/CW7CXIbeImMus
	EF2zfGp/WYtwSb0sZCyY3d8o1CHB2pEmNoKphIryNtJSSBvz8NS2qrf8NIoLSOjdho8pXwYxVCUAv
	qPGT6ZLg==;
Received: from localhost ([::1]:41712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHmDE-0023QB-TX; Tue, 08 Oct 2019 09:55:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHmDA-0023Q4-JF
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 09:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=37QZa7G8FuhZe1z2ZF7RpnHJefj+oQ0iwWWwCf0R5O4=; b=byI0EW+7sNQ8C2WlPlLaypGr/8
 8NI/eFtUa/pnzyFs4YFPcZYGqhLGkxJQW6C6eIohSQQS/q+BZX9oHAr1oJOF8tggcYzBHSrvJmv28
 4jfUfEWPkn778yc3cVjzpRz6qzTACt70Qf5THeNGx+z0FTw26F0JkEqPeIDbRRqzTTGA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHmD7-00052Q-O1
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 09:55:20 +0000
Subject: Re: Samba and legacy Windows support
To: samba-technical@lists.samba.org
References: <5849953.E8HlOTvGIY@magrathea>
Message-ID: <90c21d9b-7a61-e2c4-bd7c-fc0d81290373@samba.org>
Date: Tue, 8 Oct 2019 10:55:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 08/10/2019 09:59, Andreas Schneider via samba-technical wrote:
> Samba with version 4.11 currently still support a lot of systems which are
> already out of support. We still get bugs to either fix support for Windows
> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
> still deployed.
>
> In order to remove support for those platforms which are very long EOL, we
> should try to make announcements when we plan to remove support.
>
> ## Steps planned
>
> With Samba 4.12 we plan to disable SMB1 by default and then remove support for
> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
We already have disabled SMB1 by default in 4.11.0
>
> If we remove support for SMB1, we could also remove support for NTLMv1 and
> Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use of
> these encryption types is blocked by the default system-wide policy and is not
> available through MIT Kerberos. DES support is fully removed from MIT Kerberos
> 1.17.
>
> NTMLv2 is still widely used and it uses RC4. This means we can't remove
> support for it till there is a valid replacement for the pure file server
> case.
>
> ## Questions
>
> * Can we remove NTLMv1 and LM keys for Samba 4.12 (remove `libcli/auth/
> smbdes.c`)?
> * Can we remove DES and 3DES Kerberos support for Samba 4.12?
> * When can we remove RC4 support with Kerberos?
>
>
>
> 	Andreas

I personally would just pick a major version (probably 4.14) and 
announce that SMB1 will be totally removed at that version along with 
anything that relies on it, but we need to tell people now that we are 
going to do this.

Rowland



