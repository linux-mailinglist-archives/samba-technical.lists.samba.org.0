Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B952F785E7F
	for <lists+samba-technical@lfdr.de>; Wed, 23 Aug 2023 19:24:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4wsjIWwULqRT8n8E+l3I16d+AGhxeQLRIuSiuisV3Ss=; b=fdvCweaadRDEj+5h/inrGz76KQ
	RZOGvBBmvdARoT6VSrtMyoTnfRhpjI7rjCWKfjvPQOW5BL6Z1wHc4kkmzJSgXDEO2cmWKebsgeI35
	ep2ZwpzTBK7PoG9c+EEOE82Dv28mkEwAf/hrvv2spZnfS1voKZ/yhwbBCDXAgcJP41ROeg3T4RQ+A
	1MjAtWVOBngeevITCtHSnQzloZAR98cFfHGK4TqW87Fx1SW5sCpAJH9OA+SIMV2cd/exRITK81qrE
	4s9uObEckS3YmKjKE7QQ8Z+faNACQ1jfuRMrx/IlZsGJxp/UnrnPuXHQdfs8jqZipS9O1t6KKlOWj
	8jHb+pUA==;
Received: from ip6-localhost ([::1]:46974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qYraW-00EAxC-VG; Wed, 23 Aug 2023 17:24:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qYraO-00EAx3-JK
 for samba-technical@lists.samba.org; Wed, 23 Aug 2023 17:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=4wsjIWwULqRT8n8E+l3I16d+AGhxeQLRIuSiuisV3Ss=; b=MZxIcTB53wcTqXoVUnl3uMLazh
 M1EC7U71rxpsf7v3jGhdKriil3W8OoVo+PKhSOnG0KRwvEDLAI5O55EfIE9CNR/OusUqSRk+/SN5n
 tIEBksr7iN+/Iwuyqx5NdHJXKvhmlhZwJUkW4Vuuknkf5u3ok1lLlxHxhS/GoHyGhyNcaYcBUvOFq
 Ya3QbwnjIr4zjfguypVNwrlbACwfD9H1p2bn5ck4kGsmNkEsvV6I/LXtO7AyX5ej2zSSxIZ89IuM4
 Iyjknn1hoWcWUuamDfubQsoPAUeW1o+bXgtZq9VIoi+cObFKFfa9WOrgQf8Pf/PE/eR1t4XglbjQL
 Az0Gbtg4Fpgn1IMvuVdOCDEsnbFBM8enSFbGv3dLAw2ZtrzhZ0VyKi2yFavASVR8wOU58h+a89RNM
 mP9y9erzCv7RkjveasHtTEyZdW4BCyzhTViWc5nXDV7jjkgGWG5epYRFFz1tcOVzX/CvBbMMZl8yt
 62xt86DBF29ovcwyPXpEKQTF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qYraN-009dLG-2c for samba-technical@lists.samba.org;
 Wed, 23 Aug 2023 17:24:03 +0000
To: samba-technical@lists.samba.org
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Wed, 23 Aug 2023 19:24:02 +0200
Message-ID: <12291030.O9o76ZdvQC@magrathea>
In-Reply-To: <E1qYkBd-00F67v-P9@hrx0.samba.org>
References: <E1qYkBd-00F67v-P9@hrx0.samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 23 August 2023 11:30:01 CEST Andreas Schneider wrote:
> The branch, master has been updated
>        via  86f67f59eaf s3: libsmb: Add a missing return statement in the
> timeout case. via  1502ef29bf4 s3:utils: Use lpcfg_set_cmdline() in vfstest
> via  b37269e032c s3:utils: Use lpcfg_set_cmdline() in testparm via 
> 91e5859b50e s3:utils: Use lpcfg_set_cmdline() in smbstatus via  8f2a9f836f6
> s3:utils: Remove trailing spaces in smbcquotas; no changes via  16a4c8c871f
> s3:utils: Use lpcfg_set_cmdline() in smbcquotas via  9ef35869864 s3:utils:
> Remove trailing spaces in smbcontrol; no changes via  7a4cb09a127 s3:utils:
> Use lpcfg_set_cmdline() in smbcontrol via  d0ca11143a1 s3:utils: Remove
> trailing spaces in smbcacls; no changes via  0e2d13c52fd s3:utils: Use
> lpcfg_set_cmdline() in smbcacls via  6c00718f3de s3:utils: Use
> lpcfg_set_cmdline() in sharesec via  ed947b16e64 s3:utils: Use
> lpcfg_set_cmdline() in regedit via  914d1a38ecb s3:utils: Use
> lpcfg_set_cmdline() in pdbedit via  10e35d6c6ea s3:utils: Remove trailing
> spaces in pdbedit; no changes via  e6ea68b46df s3:utils: Use
> lpcfg_set_cmdline() in net
>        via  2eced25407d s3:utils: Use lpcfg_set_cmdline() in mdsearch
>        via  041e28d9244 s3:utils: Use lpcfg_set_cmdline() in dbwrap_torture
>        via  0534e1cad5c s3:utils: Use lpcfg_set_cmdline() in dbwrap_tool
>        via  993ba8a8fc6 s3:rpc_server: Use lpcfg_set_cmdline() in
> test_mdsparser_es via  4a54b0051da s3:rpcclient: Use lpcfg_set_cmdline()
>        via  b9a73ff61bd examples: Use lpcfg_set_cmdline()
>        via  c291ab2a030 s3:param: Use lpcfg_set_cmdline()
>       from  81226b5179e vfs_aio_pthread: use SMB_VFS_NEXT_OPENAT() in
> aio_pthread_openat_fn()

Ups, I pushed a bunch of patches by accident.

Here is an MR to revert them.

https://gitlab.com/samba-team/samba/-/merge_requests/3236



	Andreas
 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit 86f67f59eafc95ad5312fd711b0295a94237e036
> Author: Jeremy Allison <jra@samba.org>
> Date:   Wed Aug 16 17:24:37 2023 -0700
> 
>     s3: libsmb: Add a missing return statement in the timeout case.
> 
>     Obvious fix (needs a malicious server to recreate).
> 
>     Found by Robert Morris <rtm@lcs.mit.edu>
> 
>     BUG: https://bugzilla.samba.org/show_bug.cgi?id=15426
> 
>     Signed-off-by: Jeremy Allison <jra@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
>     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>     Autobuild-Date(master): Wed Aug 23 09:29:51 UTC 2023 on atb-devel-224
> 
> commit 1502ef29bf4b7a41cc23d57fa2d245a70663b035
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 08:34:14 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in vfstest
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit b37269e032c13a545af3c3ca51668ad9ee06d4c8
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:52:32 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in testparm
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 91e5859b50e0aee18b53b12ed648cf5d513fc948
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:48:22 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in smbstatus
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 8f2a9f836f688c539c623dce31c68e7af8389fdb
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:43:48 2023 +0300
> 
>     s3:utils: Remove trailing spaces in smbcquotas; no changes
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 16a4c8c871f4c087f0cbefabaa14e4dfe5b6b798
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:43:06 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in smbcquotas
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 9ef35869864fe249eeaf0691e174c2d4adf05b20
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:35:59 2023 +0300
> 
>     s3:utils: Remove trailing spaces in smbcontrol; no changes
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 7a4cb09a127745f7fccc3ba6514883805d639274
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:34:38 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in smbcontrol
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit d0ca11143a1d7af7790f973791e3066a645441f6
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:26:40 2023 +0300
> 
>     s3:utils: Remove trailing spaces in smbcacls; no changes
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 0e2d13c52fd44ef63e40230e81344f92f401665f
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:25:28 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in smbcacls
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 6c00718f3de8a86ac659e07b98c1c85773e76fd0
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:20:58 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in sharesec
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit ed947b16e64c5640e8f541f8ccf6b4c07793faba
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:17:28 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in regedit
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 914d1a38ecbd21c7cb32853c1597d828b9d4405c
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:13:00 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in pdbedit
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 10e35d6c6ea2e46d42790bedb0b24e6c17b3195f
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 07:08:29 2023 +0300
> 
>     s3:utils: Remove trailing spaces in pdbedit; no changes
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit e6ea68b46df7681bbdf91ef8649a1b81badaf203
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 06:56:07 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in net
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 2eced25407de83699e0407ee49d9eae2582e0ad7
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 06:32:14 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in mdsearch
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 041e28d9244e0f548c6a1a217fe5181ee1e06b71
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 06:24:47 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in dbwrap_torture
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 0534e1cad5c7aa6c2334f03f50e5928b44110a4d
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Mon Aug 7 06:20:26 2023 +0300
> 
>     s3:utils: Use lpcfg_set_cmdline() in dbwrap_tool
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 993ba8a8fc6588a96c8066e82b0353452ef3fa3f
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Sun Aug 6 22:29:02 2023 +0300
> 
>     s3:rpc_server: Use lpcfg_set_cmdline() in test_mdsparser_es
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit 4a54b0051da1499e31afaed2c65747b908d7624e
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Sun Aug 6 22:19:26 2023 +0300
> 
>     s3:rpcclient: Use lpcfg_set_cmdline()
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit b9a73ff61bdffb708fd8591eb8787dbb76baef78
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Sun Aug 6 17:39:36 2023 +0300
> 
>     examples: Use lpcfg_set_cmdline()
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> commit c291ab2a0303bbcfe1591a075868daf173e30541
> Author: Pavel Kalugin <pkalugin@inno.tech>
> Date:   Sun Aug 6 17:25:33 2023 +0300
> 
>     s3:param: Use lpcfg_set_cmdline()
> 
>     Signed-off-by: Pavel Kalugin <pkalugin@inno.tech>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> -----------------------------------------------------------------------
> 
> Summary of changes:
>  examples/fuse/smb2mount.c                     |  7 ++++--
>  source3/libsmb/clidfs.c                       |  1 +
>  source3/param/test_lp_load.c                  |  5 ++++-
>  source3/rpc_server/mdssvc/test_mdsparser_es.c |  4 +++-
>  source3/rpcclient/rpcclient.c                 |  8 +++++--
>  source3/torture/vfstest.c                     |  4 +++-
>  source3/utils/dbwrap_tool.c                   |  5 ++++-
>  source3/utils/dbwrap_torture.c                |  5 ++++-
>  source3/utils/mdsearch.c                      |  4 +++-
>  source3/utils/net.c                           |  7 +++---
>  source3/utils/net_printing.c                  |  9 ++++----
>  source3/utils/net_vfs.c                       |  2 +-
>  source3/utils/pdbedit.c                       | 21 ++++++++++--------
>  source3/utils/regedit.c                       |  5 ++++-
>  source3/utils/sharesec.c                      |  5 ++++-
>  source3/utils/smbcacls.c                      | 13 ++++++-----
>  source3/utils/smbcontrol.c                    | 31
> +++++++++++++++------------ source3/utils/smbcquotas.c                    |
> 20 ++++++++++------- source3/utils/status.c                        |  5
> ++++-
>  source3/utils/testparm.c                      |  5 ++++-
>  20 files changed, 108 insertions(+), 58 deletions(-)
> 
> 
> Changeset truncated at 500 lines:
> 
> diff --git a/examples/fuse/smb2mount.c b/examples/fuse/smb2mount.c
> index 7133927ad16..0594ced1308 100644
> --- a/examples/fuse/smb2mount.c
> +++ b/examples/fuse/smb2mount.c
> @@ -21,6 +21,7 @@
>  #include "source3/include/includes.h"
>  #include "popt.h"
>  #include "lib/cmdline/cmdline.h"
> +#include "lib/param/param.h"
>  #include "client.h"
>  #include "libsmb/proto.h"
>  #include "clifuse.h"
> @@ -51,6 +52,7 @@ int main(int argc, char *argv[])
>  {
>  	const char **argv_const = discard_const_p(const char *, argv);
>  	TALLOC_CTX *frame = talloc_stackframe();
> +	struct loadparm_context *lp_ctx = NULL;
>  	poptContext pc;
>  	int opt, ret;
>  	int port = 0;
> @@ -78,8 +80,9 @@ int main(int argc, char *argv[])
>  		TALLOC_FREE(frame);
>  		exit(1);
>  	}
> -	lp_set_cmdline("client min protocol", "SMB2");
> -	lp_set_cmdline("client max protocol", "SMB3_11");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "client min protocol", "SMB2");
> +	lpcfg_set_cmdline(lp_ctx, "client max protocol", "SMB3_11");
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> diff --git a/source3/libsmb/clidfs.c b/source3/libsmb/clidfs.c
> index 04c82e82575..d7dbf97f8fb 100644
> --- a/source3/libsmb/clidfs.c
> +++ b/source3/libsmb/clidfs.c
> @@ -202,6 +202,7 @@ static NTSTATUS do_connect(TALLOC_CTX *ctx,
>  			 c->timeout,
>  			 smbXcli_conn_remote_name(c->conn));
>  		cli_shutdown(c);
> +		return status;
>  	} else if (!NT_STATUS_IS_OK(status)) {
>  		d_printf("Protocol negotiation to server %s (for a protocol 
between %s
> and %s) failed: %s\n", smbXcli_conn_remote_name(c->conn),
> diff --git a/source3/param/test_lp_load.c b/source3/param/test_lp_load.c
> index 9f3d5516805..493aa316d38 100644
> --- a/source3/param/test_lp_load.c
> +++ b/source3/param/test_lp_load.c
> @@ -19,6 +19,7 @@
> 
>  #include "includes.h"
>  #include "lib/cmdline/cmdline.h"
> +#include "lib/param/param.h"
> 
>  int main(int argc, const char **argv)
>  {
> @@ -46,6 +47,7 @@ int main(int argc, const char **argv)
>  	};
> 
>  	TALLOC_CTX *frame = talloc_stackframe();
> +	struct loadparm_context *lp_ctx = NULL;
> 
>  	smb_init_locale();
> 
> @@ -57,7 +59,8 @@ int main(int argc, const char **argv)
>  		TALLOC_FREE(frame);
>  		exit(ENOMEM);
>  	}
> -	lp_set_cmdline("log level", "0");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "0");
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> diff --git a/source3/rpc_server/mdssvc/test_mdsparser_es.c
> b/source3/rpc_server/mdssvc/test_mdsparser_es.c index
> af2b8e64840..02270a9b066 100644
> --- a/source3/rpc_server/mdssvc/test_mdsparser_es.c
> +++ b/source3/rpc_server/mdssvc/test_mdsparser_es.c
> @@ -264,6 +264,7 @@ int main(int argc, const char *argv[])
>  	int opt;
>  	bool ok;
>  	TALLOC_CTX *frame = talloc_stackframe();
> +	struct loadparm_context *lp_ctx = NULL;
> 
>  	smb_init_locale();
> 
> @@ -275,7 +276,8 @@ int main(int argc, const char *argv[])
>  		TALLOC_FREE(frame);
>  		exit(1);
>  	}
> -	lp_set_cmdline("log level", "1");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "1");
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> diff --git a/source3/rpcclient/rpcclient.c b/source3/rpcclient/rpcclient.c
> index 27fe5d705c6..f59bf6b0c98 100644
> --- a/source3/rpcclient/rpcclient.c
> +++ b/source3/rpcclient/rpcclient.c
> @@ -37,6 +37,7 @@
>  #include "cmdline_contexts.h"
>  #include "../librpc/gen_ndr/ndr_samr.h"
>  #include "lib/cmdline/cmdline.h"
> +#include "lib/param/param.h"
> 
>  enum pipe_auth_type_spnego {
>  	PIPE_AUTH_TYPE_SPNEGO_NONE = 0,
> @@ -331,7 +332,8 @@ static NTSTATUS cmd_debuglevel(struct rpc_pipe_client
> *cli, TALLOC_CTX *mem_ctx, }
> 
>  	if (argc == 2) {
> -		lp_set_cmdline("log level", argv[1]);
> +		struct loadparm_context *lp_ctx = 
samba_cmdline_get_lp_ctx();
> +		lpcfg_set_cmdline(lp_ctx, "log level", argv[1]);
>  	}
> 
>  	printf("debuglevel is %d\n", DEBUGLEVEL);
> @@ -1164,6 +1166,7 @@ out_free:
>  	const char *binding_string = NULL;
>  	const char *host;
>  	struct cli_credentials *creds = NULL;
> +	struct loadparm_context *lp_ctx = NULL;
>  	bool ok;
> 
>  	/* make sure the vars that get altered (4th field) are in
> @@ -1194,7 +1197,8 @@ out_free:
>  	if (!ok) {
>  		DBG_ERR("Failed to init cmdline parser!\n");
>  	}
> -	lp_set_cmdline("log level", "0");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "0");
> 
>  	/* Parse options */
>  	pc = samba_popt_get_context(getprogname(),
> diff --git a/source3/torture/vfstest.c b/source3/torture/vfstest.c
> index 3f01c431289..b25dfdc41d5 100644
> --- a/source3/torture/vfstest.c
> +++ b/source3/torture/vfstest.c
> @@ -37,6 +37,7 @@
>  #include "lib/smbd_shim.h"
>  #include "system/filesys.h"
>  #include "lib/global_contexts.h"
> +#include "lib/param/param.h"
> 
>  /* List to hold groups of commands */
>  static struct cmd_list {
> @@ -205,7 +206,8 @@ static NTSTATUS cmd_debuglevel(struct vfs_state *vfs,
> TALLOC_CTX *mem_ctx, int a }
> 
>  	if (argc == 2) {
> -		lp_set_cmdline("log level", argv[1]);
> +		struct loadparm_context *lp_ctx = 
samba_cmdline_get_lp_ctx();
> +		lpcfg_set_cmdline(lp_ctx, "log level", argv[1]);
>  	}
> 
>  	printf("debuglevel is %d\n", DEBUGLEVEL);
> diff --git a/source3/utils/dbwrap_tool.c b/source3/utils/dbwrap_tool.c
> index 3c7f39854c8..eb97d641f64 100644
> --- a/source3/utils/dbwrap_tool.c
> +++ b/source3/utils/dbwrap_tool.c
> @@ -28,6 +28,7 @@
>  #include "messages.h"
>  #include "util_tdb.h"
>  #include "cmdline_contexts.h"
> +#include "lib/param/param.h"
> 
>  enum dbwrap_op { OP_FETCH, OP_STORE, OP_DELETE, OP_ERASE, OP_LISTKEYS,
>  		 OP_EXISTS };
> @@ -380,6 +381,7 @@ int main(int argc, const char **argv)
>  	int tdb_flags = TDB_DEFAULT;
> 
>  	TALLOC_CTX *mem_ctx = talloc_stackframe();
> +	struct loadparm_context *lp_ctx = NULL;
> 
>  	int ret = 1;
>  	bool ok;
> @@ -405,7 +407,6 @@ int main(int argc, const char **argv)
>  	smb_init_locale();
> 
>  	setup_logging(argv[0], DEBUG_DEFAULT_STDERR);
> -	lp_set_cmdline("log level", "0");
> 
>  	ok = samba_cmdline_init(mem_ctx,
>  				SAMBA_CMDLINE_CONFIG_CLIENT,
> @@ -415,6 +416,8 @@ int main(int argc, const char **argv)
>  		TALLOC_FREE(mem_ctx);
>  		exit(1);
>  	}
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "0");
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> diff --git a/source3/utils/dbwrap_torture.c b/source3/utils/dbwrap_torture.c
> index 7a6d939cae7..ec33853720a 100644
> --- a/source3/utils/dbwrap_torture.c
> +++ b/source3/utils/dbwrap_torture.c
> @@ -26,6 +26,7 @@
>  #include "dbwrap/dbwrap_open.h"
>  #include "messages.h"
>  #include "lib/util/util_tdb.h"
> +#include "lib/param/param.h"
> 
>  #if 0
>  #include "lib/events/events.h"
> @@ -253,6 +254,7 @@ int main(int argc, const char *argv[])
>  	int tdb_flags;
>  	bool ok;
>  	int ret = 1;
> +	struct loadparm_context *lp_ctx = NULL;
> 
>  	mem_ctx = talloc_stackframe();
> 
> @@ -272,7 +274,8 @@ int main(int argc, const char *argv[])
>  		TALLOC_FREE(mem_ctx);
>  		exit(1);
>  	}
> -	lp_set_cmdline("log level", "0");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "0");
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> diff --git a/source3/utils/mdsearch.c b/source3/utils/mdsearch.c
> index 1472b5cfa32..0f5b8873c68 100644
> --- a/source3/utils/mdsearch.c
> +++ b/source3/utils/mdsearch.c
> @@ -36,6 +36,7 @@ int main(int argc, char **argv)
>  {
>  	const char **const_argv = discard_const_p(const char *, argv);
>  	TALLOC_CTX *frame = talloc_stackframe();
> +	struct loadparm_context *lp_ctx = NULL;
>  	struct tevent_context *ev = NULL;
>  	struct cli_credentials *creds = NULL;
>  	struct rpc_pipe_client *rpccli = NULL;
> @@ -88,7 +89,8 @@ int main(int argc, char **argv)
>  		TALLOC_FREE(frame);
>  		exit(1);
>  	}
> -	lp_set_cmdline("log level", "1");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "1");
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> diff --git a/source3/utils/net.c b/source3/utils/net.c
> index 8272d8c4696..3106463a2a1 100644
> --- a/source3/utils/net.c
> +++ b/source3/utils/net.c
> @@ -53,6 +53,7 @@
>  #include "auth/credentials/credentials.h"
>  #include "source3/utils/passwd_proto.h"
>  #include "auth/gensec/gensec.h"
> +#include "lib/param/param.h"
> 
>  #ifdef WITH_FAKE_KASERVER
>  #include "utils/net_afs.h"
> @@ -1263,8 +1264,9 @@ static struct functable net_func[] = {
>  		TALLOC_FREE(frame);
>  		exit(1);
>  	}
> +	c->lp_ctx = samba_cmdline_get_lp_ctx();
>  	/* set default debug level to 0 regardless of what smb.conf sets */
> -	lp_set_cmdline("log level", "0");
> +	lpcfg_set_cmdline(c->lp_ctx, "log level", "0");
>  	c->private_data = net_func;
> 
>  	pc = samba_popt_get_context(getprogname(),
> @@ -1300,7 +1302,6 @@ static struct functable net_func[] = {
>  	}
> 
>  	c->creds = samba_cmdline_get_creds();
> -	c->lp_ctx = samba_cmdline_get_lp_ctx();
> 
>  	{
>  		enum credentials_obtained username_obtained =
> @@ -1353,7 +1354,7 @@ static struct functable net_func[] = {
>  	}
> 
>  	if (c->opt_requester_name) {
> -		lp_set_cmdline("netbios name", c->opt_requester_name);
> +		lpcfg_set_cmdline(c->lp_ctx, "netbios name", c-
>opt_requester_name);
>  	}
> 
>  	if (!c->opt_target_workgroup) {
> diff --git a/source3/utils/net_printing.c b/source3/utils/net_printing.c
> index a7f31ae1ac3..04a3acc3636 100644
> --- a/source3/utils/net_printing.c
> +++ b/source3/utils/net_printing.c
> @@ -31,6 +31,7 @@
>  #include "../librpc/gen_ndr/ndr_winreg.h"
>  #include "util_tdb.h"
>  #include "printing/nt_printing_migrate.h"
> +#include "lib/param/param.h"
> 
>  #define FORMS_PREFIX "FORMS/"
>  #define FORMS_PREFIX_LEN 6
> @@ -252,7 +253,7 @@ static int net_printing_dump(struct net_context *c, int
> argc, }
> 
>  	if (o->encoding != NULL) {
> -		lp_set_cmdline("dos charset", o->encoding);
> +		lpcfg_set_cmdline(c->lp_ctx, "dos charset", o->encoding);
>  		d_fprintf(stderr, _("do string conversion from %s to %s\n"),
>  				    lp_dos_charset(), lp_unix_charset());
>  		do_string_conversion = true;
> @@ -357,7 +358,7 @@ static int net_printing_dump(struct net_context *c, int
> argc, ret = 0;
> 
>   done:
> -	lp_set_cmdline("dos charset", save_dos_charset);
> +	lpcfg_set_cmdline(c->lp_ctx, "dos charset", save_dos_charset);
>  	talloc_free(ctx);
>  	return ret;
>  }
> @@ -398,7 +399,7 @@ static NTSTATUS printing_migrate_internal(struct
> net_context *c, }
> 
>  	if (o->encoding != NULL) {
> -		lp_set_cmdline("dos charset", o->encoding);
> +		lpcfg_set_cmdline(c->lp_ctx, "dos charset", o->encoding);
>  		d_fprintf(stderr, _("do string conversion from %s to %s\n"),
>  				    lp_dos_charset(), lp_unix_charset());
>  		do_string_conversion = true;
> @@ -522,7 +523,7 @@ static NTSTATUS printing_migrate_internal(struct
> net_context *c, status = NT_STATUS_OK;
> 
>   done:
> -	lp_set_cmdline("dos charset", save_dos_charset);
> +	lpcfg_set_cmdline(c->lp_ctx, "dos charset", save_dos_charset);
>  	talloc_free(tmp_ctx);
>  	return status;
>  }
> diff --git a/source3/utils/net_vfs.c b/source3/utils/net_vfs.c
> index 0cdfc44b9b7..410eef3106a 100644
> --- a/source3/utils/net_vfs.c
> +++ b/source3/utils/net_vfs.c
> @@ -143,7 +143,7 @@ static int net_vfs_init(struct net_context *c, int argc,
> const char **argv) umask(0);
>  	sec_init();
>  	setup_logging("net", DEBUG_STDOUT);
> -	lp_set_cmdline("log level", "0");
> +	lpcfg_set_cmdline(c->lp_ctx, "log level", "0");
> 
>  	ok = lp_load_with_registry_shares(get_dyn_CONFIGFILE());
>  	if (!ok) {
> diff --git a/source3/utils/pdbedit.c b/source3/utils/pdbedit.c
> index ede467108bb..554eaf0ed67 100644
> --- a/source3/utils/pdbedit.c
> +++ b/source3/utils/pdbedit.c
> @@ -28,6 +28,7 @@
>  #include "cmdline_contexts.h"
>  #include "passwd_proto.h"
>  #include "lib/util/smb_strtox.h"
> +#include "lib/param/param.h"
> 
>  #define BIT_BACKEND	0x00000004
>  #define BIT_VERBOSE	0x00000008
> @@ -228,7 +229,7 @@ static int reinit_account_policies (void)
>   Add all currently available account policy from tdb to one backend
>   ********************************************************/
> 
> -static int export_account_policies (struct pdb_methods *in, struct
> pdb_methods *out) +static int export_account_policies (struct pdb_methods
> *in, struct pdb_methods *out) {
>  	int i;
> 
> @@ -327,7 +328,7 @@ static int print_sam_info (struct samu *sam_pwent, bool
> verbosity, bool smbpwdst printf ("LM hash             : %s\n", temp);
>  			pdb_sethexpwd(temp, pdb_get_nt_passwd(sam_pwent),
> pdb_get_acct_ctrl(sam_pwent)); printf ("NT hash             : %s\n", temp);
> -		}
> +		}
> 
>  	} else if (smbpwdstyle) {
>  		char lm_passwd[33];
> @@ -623,18 +624,18 @@ static int set_user_info(const char *username, const
> char *fullname, fprintf(stderr, "Invalid hash\n");
>  			return -1;
>  		}
> -
> +
>  		pdb_gethexpwd(str_hex_pwd, new_nt_p16);
> -
> +
>  		if (!pdb_set_nt_passwd (sam_pwent, new_nt_p16 , 
PDB_CHANGED)) {
>  			fprintf(stderr, "Failed to set password from nt-
hash\n");
>  			return -1;
> -		}
> +		}
> 
>  		if (!pdb_set_pass_last_set_time (sam_pwent, time(NULL), 
PDB_CHANGED)){
>  			fprintf(stderr, "Failed to set last password set 
time\n");
>  			return -1;
> -		}
> +		}
>  		if (!pdb_update_history(sam_pwent, new_nt_p16)){
>  			fprintf(stderr, "Failed to update password 
history\n");
>  			return -1;
> @@ -642,7 +643,7 @@ static int set_user_info(const char *username, const
> char *fullname, }
> 
>  	if (NT_STATUS_IS_OK(pdb_update_sam_account(sam_pwent))) {
> -
> +
>  		print_user_info(username, True, (str_hex_pwd != NULL ));
>  	} else {
>  		fprintf (stderr, "Unable to modify entry!\n");
> @@ -1067,6 +1068,7 @@ int main(int argc, const char **argv)
>  	static char *kickoff_time = NULL;
>  	static char *str_hex_pwd = NULL;
>  	TALLOC_CTX *frame = talloc_stackframe();
> +	struct loadparm_context *lp_ctx = NULL;
>  	NTSTATUS status;
>  	poptContext pc;
>  	bool ok;
> @@ -1122,6 +1124,7 @@ int main(int argc, const char **argv)
>  		TALLOC_FREE(frame);
>  		exit(1);
>  	}
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> 
>  	pc = samba_popt_get_context(getprogname(),
>  				    argc,
> @@ -1188,13 +1191,13 @@ int main(int argc, const char **argv)
>  			(kickoff_time ? BIT_KICKOFFTIME : 0) +
>  			(str_hex_pwd ? BIT_PWSETNTHASH : 0 ) +
>  			(acct_desc ? BIT_DESCRIPTION : 0);
> -
> +
> 
>  	if (setparms & BIT_BACKEND) {
>  		/* HACK: set the global passdb backend by overwriting 
globals.
>  		 * This way we can use regular pdb functions for default
>  		 * operations that do not involve passdb migrations */
> -		lp_set_cmdline("passdb backend", backend);
> +		lpcfg_set_cmdline(lp_ctx, "passdb backend", backend);
>  	} else {
>  		backend = lp_passdb_backend();
>  	}
> diff --git a/source3/utils/regedit.c b/source3/utils/regedit.c
> index c7144ee1c70..f81058284f8 100644
> --- a/source3/utils/regedit.c
> +++ b/source3/utils/regedit.c
> @@ -19,6 +19,7 @@
> 
>  #include "includes.h"
>  #include "lib/cmdline/cmdline.h"
> +#include "lib/param/param.h"
>  #include "lib/util/data_blob.h"
>  #include "lib/registry/registry.h"
>  #include "regedit.h"
> @@ -773,6 +774,7 @@ int main(int argc, char **argv)
>  	struct registry_context *ctx;
>  	WERROR rv;
>  	bool ok;
> +	struct loadparm_context *lp_ctx = NULL;
> 
>  	frame = talloc_stackframe();
> 
> @@ -786,7 +788,8 @@ int main(int argc, char **argv)
>  		TALLOC_FREE(frame);
>  		exit(1);
>  	}
> -	lp_set_cmdline("log level", "0");
> +	lp_ctx = samba_cmdline_get_lp_ctx();
> +	lpcfg_set_cmdline(lp_ctx, "log level", "0");
> 
>  	/* process options */
>  	pc = samba_popt_get_context(getprogname(),
> diff --git a/source3/utils/sharesec.c b/source3/utils/sharesec.c
> index 9b8064de702..6e4a424b1c5 100644
> --- a/source3/utils/sharesec.c
> +++ b/source3/utils/sharesec.c
> @@ -30,6 +30,7 @@ struct cli_state;
>  #include "util_sd.h"
>  #include "cmdline_contexts.h"
>  #include "lib/util/string_wrappers.h"
> +#include "lib/param/param.h"
> 
>  static TALLOC_CTX *ctx;
> 
> @@ -336,6 +337,7 @@ int main(int argc, const char *argv[])
>  	poptContext pc;
>  	bool initialize_sid = False;
>  	bool ok;
> +	struct loadparm_context *lp_ctx = NULL;
>  	struct poptOption long_options[] = {
>  		POPT_AUTOHELP
>  		{
> @@ -450,8 +452,9 @@ int main(int argc, const char *argv[])
>  		TALLOC_FREE(ctx);
>  		exit(1);
>  	}
> +	lp_ctx = samba_cmdline_get_lp_ctx();
>  	/* set default debug level to 1 regardless of what smb.conf sets */
> -	lp_set_cmdline("log level", "1");
> +	lpcfg_set_cmdline(lp_ctx, "log level", "1");


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



