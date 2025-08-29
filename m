Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFBB3BA10
	for <lists+samba-technical@lfdr.de>; Fri, 29 Aug 2025 13:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lA+5nGJAjx3gqbvnBYhwThLNYsg3mRmlH7d2M7OsnuU=; b=URwU07DECrpzN2+4I9SO/nS4eR
	KPR34CSXRNuVIz5tmVivb/WTXgELdpcQI1nkA0mN7GnRfg/hMkTkWdMAWIoNK6Qsah8h+a68zW0d4
	Zan5d2OD9EHc5RKyrLo8o+VGrdP9WfWw9hQjWx8tBsKz4JEGA9E4GRbNkC6l01P2/IXCTFooJKX4V
	J98nc7Wof2jiT3Jcbc3kHH6151/3uluLwogHFGEuxsMD7eI99BgpALpeRXXip/6c16u5KYPIimm2c
	2LBHNZxyfdFrB6spJYHeOGg02MT7z8o3vTOWjhwAK9EQ0DZzYVv+/8uno/6NCGNVkekWBsCigQ3EW
	U0qnjfUg==;
Received: from ip6-localhost ([::1]:49600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1urxUD-000kde-NU; Fri, 29 Aug 2025 11:41:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27416) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1urxU8-000kdX-Rn
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 11:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=lA+5nGJAjx3gqbvnBYhwThLNYsg3mRmlH7d2M7OsnuU=; b=1FFJS1PfdPZZQdcKLsKEEWVmHZ
 54RJs4WWFDq/LTvCqt6pH4QhBqVRab21hdi0IjsXT3aBh86QBoSFN19rxXGoNG7AYvYmfy5fHCQUu
 j1mZ9vnPh5xt3vum3i1+omDI+o1yXGzDjlbiQY8Vf8qlwkmsHb+9y3/Akd65/eQQzZwQWFC9ROC0L
 UNUv7F1MqrpwlB7SJJYF/+8yO61MtNURxV+G/LstplMBjKe+Qq16Xc9Bh8PnOtu15lKlmAubH6bxn
 nU7DX0meNm6yo8xfeCouq1MWglvmiHXFSc0SKpyqhcoHWw74+BOq9J/wkvfsmX4FfSx4+yfDYGKAl
 Ay+IM5N+htWxxX77z9hx31EPJQjB6oREjLRRC9kWLLcjM2JJvH+0mZu39/rICtNpjfwCvBcxLvA4y
 RjTABoD5Xk+SQDIOzDpgS468lU8Lq36K7plpG6Jg8Zm0bZ0jTEgIYQ0QNky8BkVEREL3wdqO6urHL
 UJ1fuMKorb8HDGfdj6y7m5r4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1urxU7-001Q6C-1R; Fri, 29 Aug 2025 11:41:35 +0000
Message-ID: <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
Date: Fri, 29 Aug 2025 13:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in
 'smbd_get_connection'
To: Steve French <smfrench@gmail.com>
References: <202508291432.M5gWPqJX-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202508291432.M5gWPqJX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-cifs@vger.kernel.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

this is strange, but the following should fix the problem:

--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -259,9 +259,11 @@ struct smbdirect_socket {

  static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
  {
-       *sc = (struct smbdirect_socket) {
-               .status = SMBDIRECT_SOCKET_CREATED,
-       };
+       /*
+        * This also sets status = SMBDIRECT_SOCKET_CREATED
+        */
+       BUILD_BUG_ON(SMBDIRECT_SOCKET_CREATED != 0);
+       memset(sc, 0, sizeof(*sc));

         init_waitqueue_head(&sc->status_wait);


It needs to be squashed into this commit:
f2e2769275f4aa6e4d5fa98004301e91282a094a smb: smbdirect: introduce smbdirect_socket_init()

Can you do that?

I'm not sure if the following should be added
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508291615.Mxyg9D9N-lkp@intel.com/

Thanks!
metze

Am 29.08.25 um 09:06 schrieb kernel test robot:
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
> head:   b79712ce1752aa38da9553b06767f68367b0d7ff
> commit: 36d70a0c8405556dea3d4e9beef708d7ed3c2b07 [28/146] smb: client: make use of smbdirect_socket_init()
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250829/202508291432.M5gWPqJX-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291432.M5gWPqJX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-lkp@intel.com/


> All warnings (new ones prefixed by >>):
> 
>>> fs/smb/client/smbdirect.c:1856:25: warning: stack frame size (1272) exceeds limit (1024) in 'smbd_get_connection' [-Wframe-larger-than]
>      1856 | struct smbd_connection *smbd_get_connection(
>           |                         ^
>     1 warning generated.

> 
> vim +/smbd_get_connection +1856 fs/smb/client/smbdirect.c
> 
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1855
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17 @1856  struct smbd_connection *smbd_get_connection(
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1857  	struct TCP_Server_Info *server, struct sockaddr *dstaddr)
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1858  {
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1859  	struct smbd_connection *ret;
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1860  	int port = SMBD_PORT;
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1861
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1862  try_again:
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1863  	ret = _smbd_get_connection(server, dstaddr, port);
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1864
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1865  	/* Try SMB_PORT if SMBD_PORT doesn't work */
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1866  	if (!ret && port == SMBD_PORT) {
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1867  		port = SMB_PORT;
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1868  		goto try_again;
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1869  	}
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1870  	return ret;
> 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1871  }
> f64b78fd1835d1d fs/cifs/smbdirect.c Long Li 2017-11-22  1872
> 
> :::::: The code at line 1856 was first introduced by commit
> :::::: 399f9539d951adf26a1078e38c1b0f10cf6c3e71 CIFS: SMBD: Implement function to create a SMB Direct connection
> 
> :::::: TO: Long Li <longli@microsoft.com>
> :::::: CC: Steve French <smfrench@gmail.com>
> 


