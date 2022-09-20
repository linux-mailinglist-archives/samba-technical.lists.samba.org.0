Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1215BE93A
	for <lists+samba-technical@lfdr.de>; Tue, 20 Sep 2022 16:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bh5JhODSYX5KQDRBD9gBYyoTJZvU7Fw2I7XOBdRGgBc=; b=PAzhUvK/vikldUPeddVzZg59mW
	kw8Q5AyWyCFWiG2fFil5DaHtWyv2lOFWWDAl1Zl4h59Zwv5APiOe/3Eu4VQ7W/ysBSOZ4hgkMU63z
	08Ix3YbAOgNHcJuSgGcCGrMYYUtiGhP/T6G+iLBHiumnwzogaFEkyCf7vftz6l4cOdNEBpPg5FUGr
	QzGcJ89Jq4aBcUeJ/Y5J5eeBOwNFOUsSAwYZXe79lgWwj0rdOAzFVCVeB57qBh+wg53X0yrYa3WFa
	OJf7y9eMw1dDtYb7xheQePUo9ajf7ZxD8ZtiTzAnOui3tUTgdSPFz9jN9OPN4SUFAfOgr9ETa4sEf
	qB2v1VPw==;
Received: from ip6-localhost ([::1]:58060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oaeTF-002HyA-Rf; Tue, 20 Sep 2022 14:43:33 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:58464) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oaeTB-002Hy0-7T
 for samba-technical@lists.samba.org; Tue, 20 Sep 2022 14:43:31 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44C7821AFA;
 Tue, 20 Sep 2022 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663685005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bh5JhODSYX5KQDRBD9gBYyoTJZvU7Fw2I7XOBdRGgBc=;
 b=pb0CKmYhXfDIZlHh+GCD4WBcI1ygj1WbIttk+OuT+ALOIMcFyS48FY9hwZu/zk5C5UMqZI
 /bHX1pGaUkTftQVyyDwVs+oPUTZpRvIG8Dzf9+7vwvrY/Vj4g1ofnKwBR3Cfi32sxbFFD5
 8erv518dvsDd0TtE2aZg8VDYrkE1oCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663685005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bh5JhODSYX5KQDRBD9gBYyoTJZvU7Fw2I7XOBdRGgBc=;
 b=nitLZjRqen8ug3dfExc4IABFQBZZFUwd6c40nhXZNfTIzN1gekg82V/fcJ2cziiO00gYPG
 6BSreDuCReRQCbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAFF413ABB;
 Tue, 20 Sep 2022 14:43:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gLDBGozRKWONHQAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Tue, 20 Sep 2022 14:43:24 +0000
Date: Tue, 20 Sep 2022 11:43:22 -0300
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [cifs]  c9ba95b978:
 BUG:KASAN:use-after-free_in_SMB2_sess_free_buffer[cifs]
Message-ID: <20220920144322.tkd6eeezfeesva3r@suse.de>
References: <20220918033619.16522-1-ematsumiya@suse.de>
 <202209201529.ec633796-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202209201529.ec633796-oliver.sang@intel.com>
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
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, lkp@intel.com,
 smfrench@gmail.com, pc@cjr.nz, samba-technical@lists.samba.org,
 lkp@lists.01.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 09/20, kernel test robot wrote:
>
>Greeting,
>
>FYI, we noticed the following commit (built with gcc-11):
>
>commit: c9ba95b978808970633b0221b70c5255ebc8630e ("[PATCH v2] cifs: replace kfree() with kfree_sensitive() for sensitive data")
>url: https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/cifs-replace-kfree-with-kfree_sensitive-for-sensitive-data/20220918-113758
>base: git://git.samba.org/sfrench/cifs-2.6.git for-next
>patch link: https://lore.kernel.org/linux-cifs/20220918033619.16522-1-ematsumiya@suse.de
>

snip

>If you fix the issue, kindly add following tag
>| Reported-by: kernel test robot <oliver.sang@intel.com>
>| Link: https://lore.kernel.org/r/202209201529.ec633796-oliver.sang@intel.com

snip

>kern  :info  : [   81.927031] CIFS: Attempting to mount \\localhost\fs
>kern  :err   : [   81.949059] ==================================================================
>kern  :err   : [   81.956956] BUG: KASAN: use-after-free in SMB2_sess_free_buffer+0xba/0x1c0 [cifs]
>kern  :err   : [   81.965177] Write of size 44 at addr ffff8881219a3c00 by task mount.cifs/1530

Will send v2.


Enzo

