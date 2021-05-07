Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4996375DD8
	for <lists+samba-technical@lfdr.de>; Fri,  7 May 2021 02:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+Xb6LUWWimtpN6a48OnLoHgp+9IeaOCqomZ5Wb9GXnU=; b=EC8FsBkc3BBOPWqZCOCTXmI0B+
	duoXEr8cD3ymf5Ve0BIhzFqdfRO4lJGCE9Bt8lquhEPRUSglYL6xGKXjWA9/P7kavr24QfANltiTW
	fE365eekZGuaj8W57+zkZdXcME/Ipkr0BpRoTDZqM6TiWr/92uDNoP446UxxhVrsCCoZ+y1oZcEIY
	O+MRtTdYMfPWJGwOzJo2RjsnuKP2WpgfyMYudNxrLTccJOJZ9WTzlNijgLs5eX7cXlu2QvfAc+T6r
	9yi9Sm3qZXImz3gHlujmnhdxQARgP6L5Oda6CIwXAoAffg6cwVrL5oqfTvKxpPNxVO7W9pknd9AHD
	KobSvkGA==;
Received: from ip6-localhost ([::1]:56174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1leoBk-00G5kQ-E6; Fri, 07 May 2021 00:17:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44122) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leoBf-00G5kH-F1
 for samba-technical@lists.samba.org; Fri, 07 May 2021 00:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=+Xb6LUWWimtpN6a48OnLoHgp+9IeaOCqomZ5Wb9GXnU=; b=Gb8MesWPCZ4XcWs+6ENGJYwPMz
 weY28YCc17JLKFwAGAcYfpWaBbFf+ugaeYvwDD7mTfVErnnIHJIANoCinvE2wDgAZH9nZR88NHe1h
 dMGb+oz/8ujv2WFSMOLaBnqafPIr31p1YuDS+q6KTnQmndWaSNKW8+tfDyJ/tQWnNLvYChPyMkid5
 +5Cj7lDN7fNm9CyVFJxf5ssLVj2xMzY7jbEPS4K1Wj79GBxW867J4WQBdMI3rxh48QdRp6z2P5avt
 GAg6OLeX4tQiqUJNszmKuZDj+22y6YdETVEkBqci8gX8wkgldWtjc8yuUbsZQR9f5Un+XfsfO4dby
 UuWww5q0U317EVRy/p/UGViTJtZTwpTgYeGvvbzeHTmTObi1ZOF0KfOKRnHZJd1dUrKFSr4kqLGyx
 gjFvGpxXWJjJPah8lSigR2xMd3zI3OF84ISWpwqLC7o0I1p0QelkqUDcrFr2qIa395k5av4XqQuzB
 lBQe3F4qWuBSDqTVI4o2L+Uj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leoBd-0004dX-GC; Fri, 07 May 2021 00:17:45 +0000
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
Message-ID: <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org>
Date: Fri, 7 May 2021 02:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

> +/*
> + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
> + * is needed if GCM256 (stronger encryption) negotiated
> + */
> +struct smb3_full_key_debug_info {
> + __u64 Suid;
> + __u16 cipher_type;
> + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */

Why this? With kerberos the authentication key can be 32 bytes too.

Why are you exporting it at all?

> + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> + __u8 smb3decryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> +} __packed;
> +

As encryption and decryption is relative wouldn't

something like smb3_s2c_cipherkey and smb3_c2s_cipherkey be better names?

They are derived with SMBS2CCipherKey and SMBC2SCipherKey as labels.

metze

