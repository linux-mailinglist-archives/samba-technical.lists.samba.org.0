Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A56BACFD3
	for <lists+samba-technical@lfdr.de>; Tue, 30 Sep 2025 15:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RYHA5ZJ3p9Ee/kHXmjdkofw9rcsqJJhwGQ4ong0C7k4=; b=Rbl72UVzPcC/abRFzzErLQsbAc
	lEOGDSqdjNBJBeRu4FGj6n98ubBGn7p7BUxIvCgGbPkgJG5JjTKqdZ0TrKml73RmYKtMErkdzCuYj
	l+DI2lV/XbkLNYNxpePsSPZSjFj1C8EA9CF135cMusXOMdi0kqtOQI2iJpx1Mc7/ZdEP/AR7uACND
	/yY3FgsZy2a0KfIkRg+JXjxHDxXcjgQqHQ9VCxDwk3p6m490JCHDe13XHMNsl926Ou87lXA6t20gx
	NsOgdSAeZz/3D7atsWKt9I+j1smeWh2yQKnREkDqDu9MsRCXpj8uoQyO/p38igJz5KW7vA9q3zhEn
	H7j9HYqg==;
Received: from ip6-localhost ([::1]:46004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v3aAi-0053fa-Cc; Tue, 30 Sep 2025 13:13:36 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:57430) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v3aAd-0053fT-Lj
 for samba-technical@lists.samba.org; Tue, 30 Sep 2025 13:13:34 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2EC2A336CF;
 Tue, 30 Sep 2025 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759238009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RYHA5ZJ3p9Ee/kHXmjdkofw9rcsqJJhwGQ4ong0C7k4=;
 b=w8pwdMW54r9DkmJptVRJ7/0B7Ygy+k0Zfd6Zo45TNM9paz1OyuypfdzuK268E2w1CVsZa0
 pKMfGYbv0nd+9KMw8UQk4Xb3nQopyV54LbcnuA5sosLtSgdbiFeFbYz6lJ1w4M3oro/Yyu
 Fh0ebUuRuJnuee/KjUDXTUIDx8Kxjqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759238009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RYHA5ZJ3p9Ee/kHXmjdkofw9rcsqJJhwGQ4ong0C7k4=;
 b=nI7REnMOfv3T2c3B9Dsc1CAkeF+eD9HX2oI7ldTU0MSTMJhyFZ5i0Xt958MGA2ykRU7BYZ
 mvgFQATprnvr0rCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759238009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RYHA5ZJ3p9Ee/kHXmjdkofw9rcsqJJhwGQ4ong0C7k4=;
 b=w8pwdMW54r9DkmJptVRJ7/0B7Ygy+k0Zfd6Zo45TNM9paz1OyuypfdzuK268E2w1CVsZa0
 pKMfGYbv0nd+9KMw8UQk4Xb3nQopyV54LbcnuA5sosLtSgdbiFeFbYz6lJ1w4M3oro/Yyu
 Fh0ebUuRuJnuee/KjUDXTUIDx8Kxjqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759238009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RYHA5ZJ3p9Ee/kHXmjdkofw9rcsqJJhwGQ4ong0C7k4=;
 b=nI7REnMOfv3T2c3B9Dsc1CAkeF+eD9HX2oI7ldTU0MSTMJhyFZ5i0Xt958MGA2ykRU7BYZ
 mvgFQATprnvr0rCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFD491342D;
 Tue, 30 Sep 2025 13:13:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1UC5HXjX22j+PgAAD6G6ig
 (envelope-from <ematsumiya@suse.de>); Tue, 30 Sep 2025 13:13:28 +0000
Date: Tue, 30 Sep 2025 10:13:18 -0300
To: Steve French <smfrench@gmail.com>
Subject: Re: [SMB CLIENT][PATCHES] directory lease debugging and configuration
Message-ID: <gstdotvoko2a4ibpqpfwwvkskjiklqjzrv4fu3zlgeegpwwzwe@sbofqypjf27i>
References: <CAH2r5muGJTYxfNN9kcnBtX0JaJDeGa6SLiiuMg+zQVkNRjP1Yw@mail.gmail.com>
 <aztzqdkslkjs6jjtrxlir65hujpl4euikgaxwq67ulfeoqnitb@wnalncavigju>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aztzqdkslkjs6jjtrxlir65hujpl4euikgaxwq67ulfeoqnitb@wnalncavigju>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_THREE(0.00)[4];
 ARC_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]
X-Spam-Flag: NO
X-Spam-Score: -3.80
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 09/30, Enzo Matsumiya wrote:
>Hi Steve, Bharath,
>
>Sending my review based on the commit messages and the patches applied
>manually on my local tree.
>
>Please try sending the patches with git-send-email next time, as it's
>much easier to apply and review.  Thanks!
>
>On 09/29, Steve French via samba-technical wrote:
>>4 patches from Bharath to improve directory lease handling (see
>>attached).  Lightly updated and rebased on current mainline, and
>>merged into cifs-2.6.git for-next.  Feedback/review/comments welcome
>>
>>commit a50843f864205ea4576638cb32321313d9c06e54
>>Author: Bharath SM <bharathsm@microsoft.com>
>>Date:   Tue Sep 2 14:18:21 2025 +0530
>>
>>   smb: client: cap smb directory cache memory via module parameter
>>
>>   The CIFS directory entry cache could grow without a global
>>   bound across mounts. Add a module-wide cap to limit memory
>>   used by cached dirents and avoid unbounded growth.
>>
>>   Introduce a new module parameter, dir_cache_max_memory_kb
>>   (KB units; 0 = unlimited). When unset and directory caching
>
>"0 = unlimited" should be "0 = ~10% of RAM"
>
>>   is enabled (dir_cache_timeout != 0), default the cap to ~10%
>>   of system RAM during module init. The parameter is exposed
>>   under: /sys/module/cifs/parameters/dir_cache_max_memory_kb.
>>
>>   Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>>   Signed-off-by: Steve French <stfrench@microsoft.com>
>
>I think this should be a sysfs module parameter, as it assumes users

shouldn't *

