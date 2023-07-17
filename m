Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCB75603A
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jul 2023 12:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=H5xd4hy2kY/eZRztaZQotn/RmeduIhk5fFfZPo1iCPY=; b=hAlqnyuiN3DJpGmt54K00wJqe1
	j/pQg0AkZBdeOd2VvYJAEjhZL4W2s/ocEGykVtAHgu1XAKm/EAHtVI9GETCYdbcmeT+/xfsfyd5/S
	87bnMOx0Dg4dr+ba2I/+ySw2wgUC1XFzW5+vAC8n8QQxpufULFgMA/JBlEZugAj9Rc9uV24T0VMWI
	bjTybkB8WN8uNm7FAEPwwlh1qeBEBGzUZXTV0VPtWVHkupNJeLpV+g7/q7P9mRh18BwYU10TtqGN3
	YlsTrL7ngh5jBwfOL9hxpD7uZc9Qwah0i1+Xa9+RnQkDOD6kRhdoLvcg62qfggl6CcEUsw0P/e2RH
	4bez+Z5w==;
Received: from ip6-localhost ([::1]:39638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qLLJI-003P2d-8D; Mon, 17 Jul 2023 10:18:32 +0000
Received: from mga02.intel.com ([134.134.136.20]:46561) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qLLJB-003P2U-C4
 for samba-technical@lists.samba.org; Mon, 17 Jul 2023 10:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689589105; x=1721125105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rDw2VpnJC+wEtUvjAwZJO48TE28zxHwL7wMChehepkY=;
 b=YupfYgcYRIv8G4FYEeAFTpt3MCFPYMeTAC3OirxX07wd1CzdjeRzBxJu
 r977J7jfeTpjCk5tfvN2dW3AOlTZbu9rh5gs068cA88Ao1ZgWQYefr+6p
 +Shsm5GWmvGAyT7Jnxr9VBKe4rChyOlfOyjciVW+Tnh5bkwan1YC9SDlw
 +C/Ft75sEQgSXxvgc66+CdQf7D1qNYsIvkTe/E79B3UBdqUOQlvbQVSF6
 Yl92oHBmhRpykGG6VWl6yfKBT2A7jps+whZZgEqWPjtQjUXwgKPfrxQZ9
 lKK/dMo/nMERb4dauZStkKVKxKWqyBdE1L8ztXLPZvQeektuXwHW5Eofr w==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:02:37 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2023 03:02:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qLL3p-008a1g-0r; Mon, 17 Jul 2023 13:02:33 +0300
Date: Mon, 17 Jul 2023 13:02:33 +0300
To: Steve French <stfrench@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] smb: client: Rework memcpy() to avoid compilation
 error
Message-ID: <ZLURuRvO3Wai//KD@smile.fi.intel.com>
References: <20230717100003.11824-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717100003.11824-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
From: Andy Shevchenko via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jul 17, 2023 at 01:00:03PM +0300, Andy Shevchenko wrote:
> In function ‘fortify_memcpy_chk’,
>     inlined from ‘CIFS_open’ at fs/smb/client/cifssmb.c:1249:3:
> include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>   592 |                         __read_overflow2_field(q_size_field, size);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Instead of memcpy() use member-by-member copy. Let compiler do its job
> on optimisation.

It seems there are more similar errors, feel free to apply this one, and/or
address the rest and consider this as a build bug report (for `make W=1`).

-- 
With Best Regards,
Andy Shevchenko



