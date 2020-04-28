Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB311BC160
	for <lists+samba-technical@lfdr.de>; Tue, 28 Apr 2020 16:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=340SPd2vCsleNN+HHeNUAxV4176vOZjejBtOTNPw/KE=; b=mPtzFmwJeJhQ0SstWnWac+QYSz
	zfDuo+/+TeI/FeVIlC2SOijig5vEewgj7l7mqwYS7vLdsIIgFnfPg1+9xy4X9JIVBMh/EPMJDVcNT
	Kg50s7441DYhkbIVjDxCLRHecpt+Sj5JA/wz4oBHes0x3Kyg8VhAk4NQi6NHn/N7E9AV7OLV5Ck2L
	IL7pqg6CbYT5ixq4FBf2dTcC+5pxPGtfgQmTA/0uKXVh2Rjs0/lG10Qz+1+iWzkJ+LgCrYheSbagO
	UFpDuqxjzT7d7opaqU4huByCPWb3ZGd+msLDGz2sDe3IRf2SbWCJlK9f4FY66e7q06G/ZOadxVMNz
	TN/5FpHg==;
Received: from localhost ([::1]:52332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jTRGw-002KN1-Vy; Tue, 28 Apr 2020 14:31:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTRGq-002KMu-92
 for samba-technical@lists.samba.org; Tue, 28 Apr 2020 14:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=340SPd2vCsleNN+HHeNUAxV4176vOZjejBtOTNPw/KE=; b=X/8pE94FY8cI4mx+DuHUoMOc4A
 MvLWyaZUPekhGzMltoWM7kqlbfOM+UfnuwMBH8dZMsJV8suYWkHGi+m/t+arHvIcRS2DV3z6HdDnG
 80fKEuuEXUpTJ0k9BOuxAVp1IWID/TAH+X4AFnLJlCsxdzG9SidRGa/AXmgP7tS89dElLKjJnzo4M
 pISzzVVXmlwLIllquJXgGN+TWH/+vuqFZG77aeE7iQuS82qJlxCpWwM0TS7iaadrvWH0cy007Qy1z
 /oD0JBt7GZaF8dqNu8I3/Ydw3sR9NDvkNaZV17qUvEpG0zJj5wkbsxo5Eik0vW0zF6HUsqxGYXHVq
 aRXWrIvN+B+OxchRKw12tETGPJT9YXkZqPq4X+MAouVKJ3cj6bpw3sbugKkAp8gGv5u0TMfej9Lv3
 5sKgdqtoBIVMQXVOFgXJnjotM2R/pDI+unUS6hgZyJ9R4KVqx2+IpNmvqKhtOnNourGd7QJ9EhQiV
 jGFH2ULIF66p1TimV9cVVkRD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTRGo-0005tg-FR; Tue, 28 Apr 2020 14:31:34 +0000
Date: Tue, 28 Apr 2020 17:31:31 +0300
To: samba-technical@lists.samba.org
Subject: RPC handles cannot be differentiated in source3 RPC server
Message-ID: <20200428143131.GE2735275@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: metze@samba.org, asn@samba.org, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I have stumbled upon a curious case of calling
lsa_OpenTrustedDomainByName call and expecting to get a handle that can
be used for setting trusted domain forest information. The client is
FreeIPA's Python code utilizing Samba DCE RPC Python bindings. The call
succeds but returns the handle of type 0 instead of type 3 as expected
by the trusted domain LSA calls.

[2020/04/28 15:31:03.875843,  4, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0)] ../../source3/rpc_server/srv_access_check.c:115(access_check_object)
  _lsa_OpenTrustedDomain: access GRANTED (requested: 0x000f007f, granted: 0x000f007f)
[2020/04/28 15:31:03.875871,  6, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_srv] ../../source3/rpc_server/rpc_handles.c:304(create_rpc_handle_internal)
  Opened policy hnd[3] [0000] 00 00 00 00 11 00 00 00   00 00 00 00 A8 5E 17 30   ........ .....^.0
  [0010] 7B 30 09 00                                        {0..
[2020/04/28 15:31:03.875903,  1, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_parse] ../../librpc/ndr/ndr.c:471(ndr_print_function_debug)
       lsa_OpenTrustedDomainByName: struct lsa_OpenTrustedDomainByName
          out: struct lsa_OpenTrustedDomainByName
              trustdom_handle          : *
                  trustdom_handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 00000011-0000-0000-a85e-17307b300900
              result                   : NT_STATUS_OK


Not surprisingly, using the handle against lsa_lsaRSetForestTrustInformation
call does not go well:

[2020/04/28 15:31:04.067880,  3, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_srv] ../../source3/rpc_server/srv_pipe.c:1530(api_rpcTNP)
  api_rpcTNP: rpc command: LSA_LSARSETFORESTTRUSTINFORMATION
[2020/04/28 15:31:04.067896,  6, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_srv] ../../source3/rpc_server/srv_pipe.c:1549(api_rpcTNP)
  api_rpc_cmds[74].fn == 0x7f81eccba380
[2020/04/28 15:31:04.067958,  1, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_parse] ../../librpc/ndr/ndr.c:471(ndr_print_function_debug)
       lsa_lsaRSetForestTrustInformation: struct lsa_lsaRSetForestTrustInformation
          in: struct lsa_lsaRSetForestTrustInformation
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000f-0000-0000-a85e-17307b300900
              trusted_domain_name      : *
                  trusted_domain_name: struct lsa_StringLarge
                      length                   : 0x0010 (16)
                      size                     : 0x0012 (18)
                      string                   : *
                          string                   : 'test.tst'
              highest_record_type      : LSA_FOREST_TRUST_DOMAIN_INFO (2)
              forest_trust_info        : *
                  forest_trust_info: struct lsa_ForestTrustInformation
                      count                    : 0x00000001 (1)
                      entries                  : *
                          entries: ARRAY(1)
                              entries                  : *
                                  entries: struct lsa_ForestTrustRecord
                                      flags                    : 0x00000000 (0)
                                             0: LSA_TLN_DISABLED_NEW     
                                             0: LSA_TLN_DISABLED_ADMIN   
                                             0: LSA_TLN_DISABLED_CONFLICT
                                             0: LSA_SID_DISABLED_ADMIN   
                                             0: LSA_SID_DISABLED_CONFLICT
                                             0: LSA_NB_DISABLED_ADMIN    
                                             0: LSA_NB_DISABLED_CONFLICT 
                                      type                     : LSA_FOREST_TRUST_TOP_LEVEL_NAME (0)
                                      time                     : Sun Apr 26 03:43:43 PM 2020 CEST
                                      forest_trust_data        : union lsa_ForestTrustData(case 0)
                                      top_level_name: struct lsa_StringLarge
                                          length                   : 0x0010 (16)
                                          size                     : 0x0012 (18)
                                          string                   : *
                                              string                   : 'test.tst'
              check_only               : 0x00 (0)
[2020/04/28 15:31:04.068500,  6, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by_hnd_internal)
  Found policy hnd[2] [0000] 00 00 00 00 0F 00 00 00   00 00 00 00 A8 5E 17 30   ........ .....^.0
  [0010] 7B 30 09 00                                        {0.. 
[2020/04/28 15:31:04.068543,  1, pid=602235, effective(1792600000, 1792600000), real(1792600000, 0), class=rpc_parse] ../../librpc/ndr/ndr.c:471(ndr_print_function_debug)
       lsa_lsaRSetForestTrustInformation: struct lsa_lsaRSetForestTrustInformation
          out: struct lsa_lsaRSetForestTrustInformation
              collision_info           : *
                  collision_info           : NULL
              result                   : NT_STATUS_INVALID_HANDLE


So I started to investigate and it is clear that in
_lsa_lsaRSetForestTrustInformation() we expect LSA handle to be of
trust type:

        if (!find_policy_by_hnd(p, r->in.handle, (void **)(void *)&handle)) {
                return NT_STATUS_INVALID_HANDLE;
        }

        if (handle->type != LSA_HANDLE_TRUST_TYPE) {
                return NT_STATUS_INVALID_HANDLE;
        }

so handle of type 0 does not work here. However,
lsa_OpenTrustedDomainByName call should have returned us the right
handle, via this code in _lsa_OpenTrustedDomain_base():

        status = create_lsa_policy_handle(p->mem_ctx, p,
                                          LSA_HANDLE_TRUST_TYPE,
                                          acc_granted,
                                          &info->sid,
                                          info->name,
                                          psd,
                                          handle);


Looking into create_lsa_policy_handle(), we can see that we never pass
the handle type explicitly down to create_policy_hnd():

bool create_policy_hnd(struct pipes_struct *p, struct policy_handle *hnd,
                       void *data_ptr)
{
        struct dcesrv_handle_old *rpc_hnd = NULL;

        rpc_hnd = create_rpc_handle_internal(p, hnd, data_ptr);
        if (rpc_hnd == NULL) {
                return false;
        }
        return true;
}

and in create_rpc_handle_internal() sets it explicitly to 0:

        /* first bit must be null */
        SIVAL(&rpc_hnd->wire_handle.handle_type, 0 , 0);

it is never then modified.

I started looking where this 'first bit must be null' comes from and
after few refactorings I got down to the commit Jeremy did in 1998 while
merging NTDOM branch server code:

commit fdeea341ed1bae670382e45eb731db1b5838ad21
Author: Jeremy Allison <jra@samba.org>
Date:   Wed Mar 11 21:11:04 1998 +0000

    "For I have laboured mightily on Luke's code, and hath broken
    all I saw" - the book of Jeremy, chapter 1 :-).

    So here is the mega-merge of the NTDOM branch server code.
    It doesn't include the new client side pieces, we'll look
    at that later.

    ....

In source4 DCE RPC server code we have dcesrv_handle_create() which
allows to pass the handle type explicitly. Indeed, there
dcesrv_lsa_OpenTrustedDomain_common() does explictly call
dcesrv_handle_create() with the correct handle type:

        handle = dcesrv_handle_create(dce_call, LSA_HANDLE_TRUSTED_DOMAIN);


The fix would be pretty obvious: update create_policy_hnd() and its
internal implementation to pass-through the handle type. This should not
affect many places:

$ git grep create_policy_hnd
source3/rpc_server/epmapper/srv_epmapper.c:             ok = create_policy_hnd(p, r->out.entry_handle, eps);
source3/rpc_server/epmapper/srv_epmapper.c:             ok = create_policy_hnd(p, r->out.entry_handle, eps);
source3/rpc_server/eventlog/srv_eventlog_nt.c:  if ( !create_policy_hnd( p, hnd, elog ) ) {
source3/rpc_server/lsa/srv_lsa_nt.c:    if (!create_policy_hnd(p, handle, info)) {
source3/rpc_server/mdssvc/srv_mdssvc_nt.c:      if (!create_policy_hnd(p, handle, mds_ctx)) {
source3/rpc_server/rpc_handles.c:  If "data_ptr" is given, this must be a talloc'ed object, create_policy_hnd
source3/rpc_server/rpc_handles.c:               DEBUG(0,("create_policy_hnd: ERROR: too many handles (%d) on this pipe.\n",
source3/rpc_server/rpc_handles.c:               DEBUG(0,("create_policy_hnd: ERROR: out of memory!\n"));
source3/rpc_server/rpc_handles.c:bool create_policy_hnd(struct pipes_struct *p, struct policy_handle *hnd,
source3/rpc_server/rpc_pipes.h:bool create_policy_hnd(struct pipes_struct *p, struct policy_handle *hnd, void *data_ptr);
source3/rpc_server/spoolss/srv_spoolss_nt.c:    if (!create_policy_hnd(p, hnd, new_printer)) {
source3/rpc_server/svcctl/srv_svcctl_nt.c:      if ( !create_policy_hnd( p, handle, info ) ) {
source3/rpc_server/winreg/srv_winreg_nt.c:      if ( !create_policy_hnd( p, hnd, key ) ) {
source3/rpc_server/winreg/srv_winreg_nt.c:      if (!create_policy_hnd(p, r->out.new_handle, new_key)) {

Anyone has anything against this change?

-- 
/ Alexander Bokovoy

