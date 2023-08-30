Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726A78D2E0
	for <lists+samba-technical@lfdr.de>; Wed, 30 Aug 2023 06:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wQEDDSZO3z43SKQdVRMonTqL842Q19PQY2gBP2QYJeE=; b=ZebISB9ECMhkREY5NkUr9TeUaM
	YKeRophl0QWNzPb9gZOkks21M1QfsaSex6DPRtgIGF4UU4a+1VZMyuLI8BCXlTQBt3nGqBHzpY3M+
	6zD6LYaVmSrrZ7ZttrvWqQCmgLZls1+EgftSCRFWn1J5yxMWCNnLrJGLtts0AAEBKXGDmRyXyqkfR
	2QXCO7ybKyoelpTsu8KE7fFLFyF3boiseyt6CB0a+u1XWlEJjMcF0jKeDtMAbdyM4GWc64wIY1DAz
	8Oy230ZgAFj8dazHc0tCqvJRBcS55LsaIns3NzX7WEp23j/HhsW6EpmonrJMJ2MF8gpR1Voak9Ajy
	WVJ3m18w==;
Received: from ip6-localhost ([::1]:30574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbDGf-00FSos-1R; Wed, 30 Aug 2023 04:57:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39328) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbDGW-00FSoj-8F
 for samba-technical@lists.samba.org; Wed, 30 Aug 2023 04:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=wQEDDSZO3z43SKQdVRMonTqL842Q19PQY2gBP2QYJeE=; b=Fzccp+jauXXCUkLafitjygDiGU
 PaLLBFAYfinXfUtzLM2zL4mk9F8t4rSyWyxEc+EEoDvXxH8z22j8oOHplZjfinS2rPNKIhGHR/TP4
 upcGZm0YuxKDBYyZik4EFUPervB+9wchgeS3y756zlzvCQFjjnjVGEe5e6dxhLXyC8f/ij1gb88Ol
 jf5inZlxf3EbopgyIr8fNUVDTTMwI1Mb8h5m+MaelFlHrt2oW8XQE2zpfTRzMpPYPYGynbWKqHCZj
 I9Wu2blVUNyQtN92rFjmnzfr87MbzSCddea6eNHZrRJknqDsgb9DplE3cAvNGApKPoS6zXqiUiy2h
 wH8yMBvRZgA0vSP+1DyOzGBjZSPtgreZyRD4+yiSVT+nJk1DOfkPbw0Ys21P2yFDlMosDY7QaiYUZ
 TlYBQ8yYdleUFHKiOU96IGDv5Zeeh6+KePblG0JFUW1/DQvDTmzXcHtVLWZLwKBsLj0Jxv+yzktc8
 R35JjGx6WqMms4o1F1qf25Xi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qbDGR-00Ahux-2X for samba-technical@lists.samba.org;
 Wed, 30 Aug 2023 04:57:13 +0000
Message-ID: <0ba84cb6-1752-fe35-6d17-def18674d9f6@samba.org>
Date: Wed, 30 Aug 2023 16:57:03 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: The changes for error injection in Samba AD-DC MSRPC requests
To: samba-technical@lists.samba.org
References: <CACyXjPx2EDb_w=MecJ=s-TP0bTCL02nFHM83KNG52JaNNVtdUw@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CACyXjPx2EDb_w=MecJ=s-TP0bTCL02nFHM83KNG52JaNNVtdUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 30/08/23 4:48 am, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> Attached are two patches to provide early access and solicit feedback
> on the error injection changes I have made so far. I suspect there are
> mistakes I have made and there may be better ways to do this, so I
> would appreciate feedback.
> 
> Since the code is under the GPL these patches must also be regarded as being so.
> 
> The changes allow you to add things like the following to the smb.conf:
> 
> "lsarpc error inject = lsa_LookupSids error NT_STATUS_RPC_CALL_FAILED
> 5; lsa_LookupSids delay 3000 5"
> 
> The meaning of this is inject the specified error into LookupSids
> responses very five requests and also delay them for 2 seconds.
> 
> The changes modify Pidl to generate code to:
> 
> 1. Parse the error injection parameter. This has to handle multiple
> RPC requests etc and may be an issue in that there may be a limit to
> the amount of text you can include. This is handled when the RPC
> interface is initialized.
> 2. Check and inject the errors when needed.
> 
> The potential problems I see:
> 
> 1. If I have not defined an smb.conf parameter for an MSRPC interface
> you cannot inject errors for it. I see that during domain join LSA and
> SAMR are used, but I have only enabled error injection for LSA. This
> is easy to fix but requires a rebuild.
> 2. I have done really ugly things in generate_param.py
> 3. The code changes in librpc/rpc/dcesrv_core.c needs to be looked at carefully.
> 
> The good news is that it seems to work and is now async. The second
> change was to ensure that if more than one client was calling MSRPC
> requests and the first one required a delay the others would also not
> hit a delay. In that respect you need to apply both changes.
> 
> The changes are based on 4.19.0rc1 but probably will apply cleanly to
> other builds. I started with mainline but then dropped back to 4.19.0.
> Also, there is an RPM SPEC file in the patch that you can possibly
> ignore.
> 
> Any feedback at all is welcome.
> 

Looks interesting! I just have a few small pieces of feedback.

diff --git a/docs-xml/smbdotconf/error_inject/lsa_inject.xml 
b/docs-xml/smbdotconf/error_inject/lsa_inject.xml
index 8c478cb8bb7..ec8758f30d1 100644
--- a/docs-xml/smbdotconf/error_inject/lsa_inject.xml
+++ b/docs-xml/smbdotconf/error_inject/lsa_inject.xml
@@ -11,7 +11,7 @@
  	</para>

  	<para>
-		This paremeter is meant for error injection.
+		This parameter is meant for error injection.
  	</para>
  </description>
  <value type="default">empty string</value>

A small typo in the documentation (paremeter → parameter).



diff --git a/pidl/lib/Parse/Pidl/Samba4/NDR/Server.pm 
b/pidl/lib/Parse/Pidl/Samba4/NDR/Server.pm
index e4474400a76..f32317d4ccd 100644
--- a/pidl/lib/Parse/Pidl/Samba4/NDR/Server.pm
+++ b/pidl/lib/Parse/Pidl/Samba4/NDR/Server.pm
@@ -147,7 +147,7 @@ static void $name\__op_unbind(struct 
dcesrv_connection_context *context, const s
  #endif
  }

-struct rpc_err_inject err_inj_table_$name\[$num_calls] = {{0}};
+static struct rpc_err_inject err_inj_table_$name\[$num_calls] = {{0}};

  static NTSTATUS $name\__op_ndr_pull(struct dcesrv_call_state 
*dce_call, TALLOC_CTX *mem_ctx, struct ndr_pull *pull, void **r)
  {

I think the err_inj_table_$name array can be made static.



@@ -268,6 +268,7 @@ sub Boilerplate_Ep_Server($)


  	pidl "
+#ifdef LIB_PARAM_$uname\_ERROR_INJECT
  static int find_$name\_function(const struct ndr_interface_table *table,
  			     char *name)
  {	int i;
@@ -280,7 +281,6 @@ static int find_$name\_function(const struct 
ndr_interface_table *table,
  	return -1;
  }

-#ifdef LIB_PARAM_$uname\_ERROR_INJECT
  /* Process one error injection entry */
  static NTSTATUS $name\_process_one_err_inj(const char *err_inj_param)
  {

The LIB_PARAM_$uname\_ERROR_INJECT #ifdef could be moved up to encompass 
find_$name\_function() and avoid a build error.

Regards,
Joseph

