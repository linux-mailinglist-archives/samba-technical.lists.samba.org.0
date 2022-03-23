Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08F4E5784
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 18:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=AHzoRkdZ9DkeqlqLLClJe2hiyc9kFW7w3+leG3o3sS0=; b=oW0jr+lL25HJ86VqSh6ZpGZICh
	k8Qt+Cuh1uvwdsuHFLa8zlHr+vsNPA1w+uzc3uFMgEX9Su4k/5fDNP4ZPmGnxc0eJ88lVVgmSxpGU
	3UGoZtAPjtJKSWEM4QW6855pTT4Zp8GLoENdw8rI1ocj9uM+xYvcK97qTQdY4UM3T9XI/7+NC1xNn
	Gm9LbXF6QOA85Cl12Fn29j/ODQWjitCxiADEXoof+1bko+R9UEZWhdxmw7vHeevRifQWBZ/PJDpBw
	hIjL6F7fx78ZtrzZ1HveDiHAjU+y4NCRB0r34Y1QlRwsvyeKk4RfWmMVQEkPy7fUyXrW1ARo5y9Gq
	Cx2fDM9g==;
Received: from ip6-localhost ([::1]:53302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX4nY-004bjy-Ba; Wed, 23 Mar 2022 17:29:28 +0000
Received: from smtp-out1.suse.de ([195.135.220.28]:38620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nX4nS-004bjo-Qt
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 17:29:25 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77BA7210F2;
 Wed, 23 Mar 2022 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648056559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AHzoRkdZ9DkeqlqLLClJe2hiyc9kFW7w3+leG3o3sS0=;
 b=NIiCU+1EniCjCXMObV7y7nyZZXeLf8AlinwI/2XT6X/ShJbcYgrGTIyn/kgyJ3vp6K4ANr
 9vEEVIKrHGd/ppxFef2hZh4EJb7Zu0PDZCbV3wY3hhsIiZDVv9C1smTfA3S0sbvrKZJYBM
 CV9JpFGyTIVbj9G1izwmioon2N33n4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648056559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AHzoRkdZ9DkeqlqLLClJe2hiyc9kFW7w3+leG3o3sS0=;
 b=WZ4Br85JnJgZ7zjkfXbkPXRLCy8L/7a5qxWZzjQP+/ghVGS9Q8mGuods7gGIR1ndVtbwTP
 cHfesVrbzi/z3EAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0753813302;
 Wed, 23 Mar 2022 17:29:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fBn1MO5YO2LxIgAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Wed, 23 Mar 2022 17:29:18 +0000
Date: Wed, 23 Mar 2022 14:29:13 -0300
To: Tom Talpey <tom@talpey.com>
Subject: Re: Signature check for LOGOFF response
Message-ID: <20220323172913.56cr2atzfcunv5kf@cyberdelia>
References: <20220319032012.46ezg2pxjlrsdlpq@cyberdelia>
 <a0972fb5-38d3-5990-7c8e-0b7dd61d1abb@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a0972fb5-38d3-5990-7c8e-0b7dd61d1abb@talpey.com>
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 smfrench@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Tom,

On 03/19, Tom Talpey wrote:
>What server is returning this unsigned response? Assuming it's Windows,
>that is either a doc bug or (arguably) a server bug, and should be
>reported before deciding how to address it here.

It's a NetApp ONTAP 9.5P13. We've identified it's also setting wrong
signatures on READ responses with STATUS_END_OF_FILE.

Our tests against Windows Server 2019 showed it to behave ok, so it
looks like something on NetApp side.

Thanks anyway.


Enzo

