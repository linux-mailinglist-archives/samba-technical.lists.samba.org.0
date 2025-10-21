Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A5BF850B
	for <lists+samba-technical@lfdr.de>; Tue, 21 Oct 2025 21:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Z+sEBHSZpi6sapWx4QF59hK4GMWdVPR9DNXmFeXvPj8=; b=Ke+yFYRKP3xqxcJbQW0QGJWrXF
	bdWakH+FVgxSnlkImk8HfrwHTP7Ah2caKgKfmS/I9YxVkGr7JneNXrnGAUPWLKAJl6Q8H5hMuEe22
	s2GFkHm/gcmiYcUGy4ClPjzJmyYkDg6Prs51x3lOmcKl8vIuQXc29yA5GnADnLHu6TYPhCm/bIJSd
	TvF0g0Lw9V65yqKsSAyoPffhLQ4j72bsVdNBpCLkipY+QT+5w7T87EggN+2mMKDdBX3jc2K+TqwWs
	zhdJLNXb5wez6w/mD00ENiV7lfaqQ05LkiWMwh6sRGlWJg2BcnSz5jXVlmX+YHB1HCN1lAHxzq2rT
	SGr8A0bQ==;
Received: from ip6-localhost ([::1]:27528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBIL9-008Sbm-F2; Tue, 21 Oct 2025 19:48:15 +0000
Received: from smtp-out2.suse.de ([195.135.223.131]:45684) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBIL4-008Sbe-Rc
 for samba-technical@lists.samba.org; Tue, 21 Oct 2025 19:48:13 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A719D1F38D;
 Tue, 21 Oct 2025 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761076083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+sEBHSZpi6sapWx4QF59hK4GMWdVPR9DNXmFeXvPj8=;
 b=hdelGbBzcBF6rRyegV2m5qWlxidFDYszwCq9uP+aVVByQ/nvGs77waauvdnUBJsC1oyPFu
 muJBWsdK+CD98P3qJKKLvAVSkXH9QTGO1ww3g8x+UKk47wMo4+iZwrdB7xSjyiqfTvEQe3
 zwvX6A8HuBiqtkBRehIUPxjgu3ySyXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761076083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+sEBHSZpi6sapWx4QF59hK4GMWdVPR9DNXmFeXvPj8=;
 b=ZevXv3Y0HZlHG2wI+Swpgb23tefhoG8IL07VzGdMmRXRA5yxrTV8kWZsdkw0mWVM2ePbx3
 Pf0rNIAQEidypuBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uxEDpkX4;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SStoReiN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761076079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+sEBHSZpi6sapWx4QF59hK4GMWdVPR9DNXmFeXvPj8=;
 b=uxEDpkX4chvRKDKgbqrgGYTX81E7yCfbZqCQeKXFN/NiyYQa+bE8ctpIxYA850ewZ1woEn
 16+tthp+Kh09uzl4kjwwkSJVHlQ9FMCacd4XgIUZx7TFxcSM01bjCN8IeBUf5FxCYxPdFu
 LVukJqf3INRrVpxowrXYPY1ntTk3ITU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761076079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+sEBHSZpi6sapWx4QF59hK4GMWdVPR9DNXmFeXvPj8=;
 b=SStoReiNKmG8jjRthtnAumR0+qS6aAQcTq6L9BxrcYpwl06uXXB0n7zUvIkak96hIYIipV
 uDf5UpqxVnoo0/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3190D139B1;
 Tue, 21 Oct 2025 19:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id plgbOm7j92iuHQAAD6G6ig
 (envelope-from <ematsumiya@suse.de>); Tue, 21 Oct 2025 19:47:58 +0000
Date: Tue, 21 Oct 2025 16:47:52 -0300
To: Thomas Spear <speeddymon@gmail.com>, Steve French <smfrench@gmail.com>, 
 samba-technical <samba-technical@lists.samba.org>, linux-cifs@vger.kernel.org
Subject: Re: mount.cifs fails to negotiate AES-256-GCM but works when
 enforced via sysfs or modprobe options
Message-ID: <4edwqongmxeuf2zvokxmzxi65k6cglammqdvsufrs4goc7qmij@g2hunlte7qm2>
References: <CAEAsNvQmV=xFsU-4jn9zC2DYoAUjXTS3qcsGNe7XUZEEXg1cLg@mail.gmail.com>
 <CAH2r5mtCjCvYphEAWir9PtxWQUy51jiir2Lk8erubUetX8TAbQ@mail.gmail.com>
 <eksh6mo4hhijkea2o3lalpbsoju7sp4nwwvo62l2fhs7hkvaid@6aisea5jt3f2>
 <CAEAsNvTNf14E8iVrtptzSqQ4Gq8QsM4sHpJ0tfTyt4mkFWCk7w@mail.gmail.com>
 <rsmt3c27mnkm2nprau6waeexxpo3y3fg43rzxjj7gxbwor3mwh@6yppid4sbeej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <rsmt3c27mnkm2nprau6waeexxpo3y3fg43rzxjj7gxbwor3mwh@6yppid4sbeej>
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A719D1F38D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,lists.samba.org,vger.kernel.org];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/21, Enzo Matsumiya via samba-technical wrote:
>On 10/21, Thomas Spear wrote:
>>This sort-of makes sense as to why it's happening. I can understand
>>some code so what I see here is:
>>
>>> else if (enable_gcm_256) {
>>>                  pneg_ctxt->DataLength = cpu_to_le16(8); /* Cipher Count + 3 ciphers */
>>>                  pneg_ctxt->CipherCount = cpu_to_le16(3);
>>>                  pneg_ctxt->Ciphers[0] = SMB2_ENCRYPTION_AES128_GCM;
>>>                  pneg_ctxt->Ciphers[1] = SMB2_ENCRYPTION_AES256_GCM;
>>>                  pneg_ctxt->Ciphers[2] = SMB2_ENCRYPTION_AES128_CCM;
>>
>>Here, AES-256-GCM is second to AES-128-GCM when enable_gcm_256 is
>>true, but if AES-256-GCM is still present as one of the ciphers as per
>>this snipped, and the server doesn't support AES-128-GCM, shouldn't it
>>fall-forward to AES-256-GCM instead of causing an error?
>
>That's correct.
>
>But I also see it working fine against Windows Server 2022.
>
>On server:
>  > Set-SmbServerConfiguration -EncryptionCiphers "AES_256_GCM"
>
>On client:
>  # mount.cifs -o ...,seal //srv/test /mnt/test
>  # cat /sys/module/cifs/parameters/require_gcm_256
>  N
>  # cat /sys/module/cifs/parameters/enable_gcm_256
>  Y
>  # grep Encryption /proc/fs/cifs/DebugData
>  Encryption: Negotiated cipher (AES256-GCM)
>
>>IOW, I'm
>>wondering if there's an issue elsewhere that's preventing the
>>AES-256-GCM cipher from being used and reordering would simply
>>band-aid the issue.
>>
>>>so if the server supports AES-256-GCM, the only way to make cifs use it
>>>is with 'require_gcm_256', unless you disable AES-128-GCM on the server
>>>(as you have observed).
>>
>>Actually, the issue I'm observing is that _when_ we disable
>>AES-128-GCM on the server (Azure Files), mount.cifs on the client is
>>failing to mount the share completely _until_ I set require_gcm_256.
>
>Azure sometimes responds with unexpected (sometimes even out of spec)
>settings.
>
>I'll setup an Azure Files instance to test this.

So I just tested this and it turns out that Azure is indeed responding
wrong values.

It responds with AES-128-GCM even when only AES-256-GCM is enabled.

Then, since cifs sends AES-128-GCM preferred by default, and Azure
replies with AES-128-GCM, all cifs can do is trust it and start
generating keys + trying to encrypt stuff.

This fails with STATUS_ACCESS_DENIED right on Session Setup
NTLMSSP_AUTH.  I didn't dig deeper so far, but it looks like Azure is
internally prepared to do AES-256-GCM, so it expects AES-256 values.

I don't think there's much to be done from cifs side TBH, so you should
try reaching out to Azure support.


HTH

Enzo

