Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E74588281
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 21:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Bg9h887C8gVWobrXRdOT9+x2p3w/uvq6a0lh9g6ugdw=; b=FML+6wlvA72xtdn4zUykcGIVuc
	dHfcKqB3BoauSWv1UxrZJMjME69inv9eKkuYTatm3QKQD2d8o1qGhtYaKYdFyyR6PP85mc/ZADxGk
	VU7atfdn/VuSbFm0jmxl92H9z/mL2YLMqXhSHLNScitYRTAo7OpRa6SUAQkTF11qmdZ61GnRVV1zU
	AbPzcpiJKwQDT5Z31t+IonAeVB0eTZSF3x9glrz2z/lWplkJsYlOWGW9GsxCB4KwGYH97+BmGbvsn
	/+mrczgQWm3hORh0rIhrEWQSbJ08uqill3NzSDBvzyv0zpCnVFn/5e3CUKnNFP9MlX1qUSsTy1aCu
	UBhU/GJg==;
Received: from ip6-localhost ([::1]:48798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIxZ1-0052I2-SP; Tue, 02 Aug 2022 19:28:23 +0000
Received: from smtp-out2.suse.de ([195.135.220.29]:39554) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIxYq-0052Ho-CS
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 19:28:15 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 722FD1FD18;
 Tue,  2 Aug 2022 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659468489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bg9h887C8gVWobrXRdOT9+x2p3w/uvq6a0lh9g6ugdw=;
 b=sPQYvAQERl6eWHdAPuPNsyhfaVCEmkC9r8nSCcKD4psu/To3u5G33OiKMg8Ee+at+kjS46
 lY21UGgRR9gRSNkgmOd1CZ9ZVjw8h/UYU/VgJYTubmxycxMqNdzEp5hcoWkCXJEg3OXQXL
 b2fRFFAs4LcTotsP2QVkgkgV65An0P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659468489;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bg9h887C8gVWobrXRdOT9+x2p3w/uvq6a0lh9g6ugdw=;
 b=gHBnpQbwmKAesnR9qkEQagwr1eS9+zywFq4ADlHcZMXXXuLNNmJJAeNUfpu2sHUUhVE1Y5
 fffmCIMNujceztBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C1913A8E;
 Tue,  2 Aug 2022 19:28:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ok4kKMh66WI/aQAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Tue, 02 Aug 2022 19:28:08 +0000
Date: Tue, 2 Aug 2022 16:28:06 -0300
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 0/5] Rename "cifs" module to "smbfs"
Message-ID: <20220802192806.6ryronlqvus2ua26@cyberdelia>
References: <20220802190048.19881-1-ematsumiya@suse.de>
 <Yul5hBFmwoOQ0cxG@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Yul5hBFmwoOQ0cxG@casper.infradead.org>
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
From: Enzo Matsumiya via samba-technical <samba-technical@lists.samba.org>
Reply-To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
 pc@cjr.nz, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, tom@talpey.com, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 08/02, Matthew Wilcox wrote:
>On Tue, Aug 02, 2022 at 04:00:43PM -0300, Enzo Matsumiya wrote:
>> Hi,
>>
>> As part of the ongoing effort to remove the "cifs" nomenclature from the
>> Linux SMB client, I'm proposing the rename of the module to "smbfs".
>>
>> As it's widely known, CIFS is associated to SMB1.0, which, in turn, is
>> associated with the security issues it presented in the past. Using
>> "SMBFS" makes clear what's the protocol in use for outsiders, but also
>> unties it from any particular protocol version. It also fits in the
>> already existing "fs/smbfs_common" and "fs/ksmbd" naming scheme.
>>
>> This short patch series only changes directory names and includes/ifdefs in
>> headers and source code, and updates docs to reflect the rename. Other
>> than that, no source code/functionality is modified (WIP though).
>
>Why did you not reply to Jeff Layton's concern before posting a v2?

Hm, I was pretty sure I did. Sorry about that, I got confused on how my
mail client organized the replies to the initial thread.

Replying to Jeff right now.

