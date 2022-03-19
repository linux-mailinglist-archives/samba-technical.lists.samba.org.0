Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D16254DE55C
	for <lists+samba-technical@lfdr.de>; Sat, 19 Mar 2022 04:39:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=P5HVMst4XokfGKAJRjIs1cTmZO3fVYAodwoctjMKPfQ=; b=iKJ1GWlUrZpZuhwVwltR+VlXQs
	6ULaBSwWn+NkZp1agnq+3BS0PMoN37PiJtqv2T0YQooo7jjcJvhF88xKZJmvnHDLSANfk1uQcrAuJ
	EZ1yXcoN9ETMHWN40k332GMmi4zisXbBcbgMI+61i8HPLpdfRk0Gqu4iKvSmoJMDX3aUb903qJZ2o
	yb4VYRdtiPKeVc1Mvui/sJnpL3iXczMvubTD9NFCqtuuP0nRIuDm4iAXfhYOgdBj1NItBdNRb5X6B
	48IV0SKA4FRs047uacmN04eA8UCnw3uCtXIJiiql5ZC63r71IuPlTBTDUGUi+0RSZbbMsH6ww+8vU
	LoCi9TvA==;
Received: from ip6-localhost ([::1]:22222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nVPvJ-003ZCL-1C; Sat, 19 Mar 2022 03:38:37 +0000
Received: from smtp-out1.suse.de ([195.135.220.28]:43878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nVPvE-003ZCC-64
 for samba-technical@lists.samba.org; Sat, 19 Mar 2022 03:38:34 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E7BB210FD;
 Sat, 19 Mar 2022 03:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647660031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=P5HVMst4XokfGKAJRjIs1cTmZO3fVYAodwoctjMKPfQ=;
 b=bNb23TSIRlsbZCu3Vh6STEuRsnhmLndGfnHCpuP7x1hgM4Rwjdjtbd+3gDAMb59SIWCugB
 oIYT2q273lfVDs9c2TasubyZAkysMlLlZ0dyhAmtmN/6cpiWcfHSnrS1rOWQcWbQqujPSQ
 iadHIN/vHcu09onAVdNMcOCqWaP5td0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647660031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=P5HVMst4XokfGKAJRjIs1cTmZO3fVYAodwoctjMKPfQ=;
 b=iaG9qMJdhJl4jLpvtNUAx9Yoxin0t+B+m4yPJOlLT9s+T0ttctN4J4fbwWyikqRllHZYXJ
 DJSbEyCVwzCoBlDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B2D1132C1;
 Sat, 19 Mar 2022 03:20:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f1JdL/5LNWKQRgAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Sat, 19 Mar 2022 03:20:30 +0000
Date: Sat, 19 Mar 2022 00:20:25 -0300
To: samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
Subject: Signature check for LOGOFF response
Message-ID: <20220319032012.46ezg2pxjlrsdlpq@cyberdelia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: smfrench@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

The LOGOFF command response is not signed (=> signature is 0x0), but we
check it anyway, displaying "sign fail" errors in ring buffer.

As far as I checked, an explicit LOGOUT is only sent when tlink pruning
happens (i.e. TLINK_IDLE_EXPIRE expires), but we have a case of this
causing issues on production env.

I didn't find LOGOFF being a signature check exception in MS-SMB2 rev64.
Relevant sections:

2.2.7 SMB2 LOGOFF Request
2.2.8 SMB2 LOGOFF Response
3.2.5.4 Receiving an SMB2 LOGOFF Response
3.3.5.6 Receiving an SMB2 LOGOFF Request

If this is implementation defined, maybe something like this could work?
(100% untested)

--- a/fs/cifs/smb2transport.c
+++ b/fs/cifs/smb2transport.c
@@ -667,6 +667,7 @@ smb2_verify_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
         if ((shdr->Command == SMB2_NEGOTIATE) ||
             (shdr->Command == SMB2_SESSION_SETUP) ||
             (shdr->Command == SMB2_OPLOCK_BREAK) ||
+           (shdr->Command == SMB2_LOGOFF) ||
             server->ignore_signature ||
             (!server->session_estab))
                 return 0;

Thoughts?


Enzo

