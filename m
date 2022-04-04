Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 270A94F196F
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 18:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=psaFexqr5P1d9QTlXvPwr9oXkBnr016sCrSRM5sYfo0=; b=BEtSiJtP5Mo0hwg3lbWrVczrNi
	gTtP3MfSkmQZ4l4DPkAtBcpi8ypNZyVXt2tdHT3sLlqSNFDAmwceW52REg0zNof78rXjTnoxPBUxW
	4kdm8hAVg44m6kW8UXjhfL2CAbI1B+bTZfJFR7hrmle/1z0GlDWjasSPPliHmSBHHl5f6CxEQkPx4
	igDMaYfLu1mYUkyRNPv/a8OYUGbuDE0ui5kQnhvweqfLw24vLuIy5xmF3/PsUsgF/SvEe1DIl5atl
	NsB7gDXkF0IEPBuIxHUFMzdbCDft0+r4zPqLMdeHPpPDCdtkc5sCU2p9+70erUbdX/4RwHLn89IVa
	minULpVw==;
Received: from ip6-localhost ([::1]:41870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbQ0R-009qjj-4U; Mon, 04 Apr 2022 16:56:43 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:35175) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbQ0M-009qjZ-I5
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 16:56:41 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8F69E40175;
 Mon,  4 Apr 2022 19:56:30 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 37C7430C;
 Mon,  4 Apr 2022 19:52:44 +0300 (MSK)
Message-ID: <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
Date: Mon, 4 Apr 2022 19:56:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: doing a test build of samba
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
In-Reply-To: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Mathieu Parent <math.parent@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

04.04.2022 13:30, Michael Tokarev via samba-technical wrote:
..
> I've been told that the --enable-selftest build should not be
> used to install things for production.

So I took a look at what --enable-selftest actually does. Here's the
list, for reference:

two new functions (not used in samba code) now return true:
  is_selftest_enabled is_ntvfs_fileserver_built

two new "printers": test and lvp

dns lookups can use file pointed to by $RESOLV_CONF variable if set,
instead of using system-wide /etc/resolv.conf.

2 ipc messages are enabled: sleep and inject (fault injection)


build enables -D WITH_NTVFS_FILESERVER=1.
This one, in turn does this:

source4/ntvfs/posix/posix_eadb.c 4 new functions:
  pull_xattr_blob_tdb() push_xattr_blob_tdb() delete_posix_eadb() unlink_posix_eadb()

source4/ntvfs/posix/wscript_build 4 new modules:
  pvfs_acl pvfs_acl_xattr pvfs_acl_nfs4 ntvfs_posix

source4/ntvfs/wscript_build 3 new modules:
  ntvfs_cifs ntvfs_simple ntvfs_ipc

source4/rpc_server/wscript_build 2 new modules:
  dcerpc_srvsvc dcerpc_winreg

source4/smb_server/wscript_build new module:
  service_smb

source4/torture/wscript_build
# Yes, the spoolss_notify test uses the NTVFS file server to run the SMB server expected
# to handle the RPC callback!
if bld.CONFIG_SET('WITH_NTVFS_FILESERVER'):
         ntvfs_specific['source'] += ' rpc/spoolss_notify.c'
         ntvfs_specific['deps'] += ' SMB_SERVER dcerpc_server ntvfs'

That's about it.

To me, this does not look like something which should be avoided
in production at all costs.

The two "new" printers are harmless, as are two new ipc messages
(okay, root can inject stuff to your samba daemons and cause delays
with a handy tool instead of using standard system tools for that :) ).

The extra ntvfs modules appears to be optional and can be left out
of the production package build.

Am I missing something or is it actually okay to use build produced
by --enable-selftest configuration?

Thanks!

/mjt

