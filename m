Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE205532AB5
	for <lists+samba-technical@lfdr.de>; Tue, 24 May 2022 14:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ijede9f6cPQ5n59ot30FTTQ/6UdCwwtRbbOvO6U/pFM=; b=SndsoHVcAPiuDaYw6rDWAEVk90
	20foOrmOV3YTGOGKS4v4V2PA8Nv6OcW1RlVIHNgXwqrEJgG4BUilBNDJlFVZCLlUBgFLA+laV/x0f
	zOFSidA5rzIjMQZcaJ9JsrplhYud/pbQqYY7LHj3c7+Yse9UIzXVIX89rw2AZYKIKg5W6yIvdRa1Z
	yecKH8xXwQ3SRvoiHgeHHtih5MQZLl6//jWvQxFaqJZVHucDnaUuz+eHQb8Qt0QJGfCZ94dUbFw4o
	DDaJhAT2mrlKbZe7u2dxKs9gkly3Vt5dvEItnuV8qBh5dxDsj0JGbnZwNTA70MvPTeJkB0uq7PzwZ
	20frBR0w==;
Received: from ip6-localhost ([::1]:21326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ntU1i-002egc-4P; Tue, 24 May 2022 12:52:42 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:50319) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ntU1a-002egS-Nk
 for samba-technical@lists.samba.org; Tue, 24 May 2022 12:52:39 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2F3C340AF7
 for <samba-technical@lists.samba.org>; Tue, 24 May 2022 15:52:32 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 416E612D
 for <samba-technical@lists.samba.org>; Tue, 24 May 2022 15:52:31 +0300 (MSK)
Message-ID: <ba1a680e-f971-1306-ecd0-4d52520ce7e2@msgid.tls.msk.ru>
Date: Tue, 24 May 2022 15:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: samba-tool domain join segfaults (4.16)
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

I'm facing a segfault in samba-tool when doing domain join, in
source3/utils/py_net.c py_net_join_member(). Here it is (with some
omissions for brevity):

static PyObject *py_net_join_member(py_net_Object *self, PyObject *args, PyObject *kwargs)
{
         struct libnet_JoinCtx *r = NULL;
...
         werr = libnet_init_JoinCtx(mem_ctx, &r);   <= here, &r is initialized okay
        // r = (struct libnet_JoinCtx *) 0xa5f850

...
         // but after this call: r becomes.. NULL.
         if (!PyArg_ParseTupleAndKeywords(args, kwargs, "|sssssszpp:Join",
                                          discard_const_p(char *, kwnames),
                                          &r->in.dnshostname,
                                          &r->in.upn,
                                          &r->in.account_ou,
                                          &r->in.os_name,
                                          &r->in.os_version,
                                          &r->in.os_servicepack,
                                          &r->in.machine_password,
                                          &r->in.debug,
                                          &no_dns_updates)) {
                 talloc_free(mem_ctx);
                 PyErr_FromString(_("Invalid arguments\n"));
                 return NULL;
         }
         // r = (struct libnet_JoinCtx *) 0x0
...
         // and here, it gets a segfault.
         r->in.domain_name       = lpcfg_realm(self->lp_ctx);
         r->in.domain_name_type  = JoinDomNameTypeDNS;

Unfortunately I don't know how to print *args and *kwargs there.
They're PyTuple_Type and PyDict_Type, respectively.

The backtrace:

BACKTRACE: 36 stack frames:
  #0 /lib/x86_64-linux-gnu/libsamba-util.so.0(log_stack_trace+0x30) [0x7ffff70510f0]
  #1 /lib/x86_64-linux-gnu/libsamba-util.so.0(smb_panic+0x9) [0x7ffff7051339]
  #2 /lib/x86_64-linux-gnu/libsamba-util.so.0(+0xf3d1) [0x7ffff70513d1]
  #3 /lib/x86_64-linux-gnu/libpthread.so.0(+0x14140) [0x7ffff7fad140]
  #4 /usr/lib/python3/dist-packages/samba/net_s3.cpython-39-x86_64-linux-gnu.so(+0x7558) [0x7ffff221c558]
  #5 /usr/bin/python3() [0x53f350]
  #6 /usr/bin/python3(_PyObject_MakeTpCall+0x39b) [0x51d89b]
  #7 /usr/bin/python3(_PyEval_EvalFrameDefault+0x5f7f) [0x517a0f]
  #8 /usr/bin/python3() [0x5106ed]
  #9 /usr/bin/python3(_PyFunction_Vectorcall+0x361) [0x528d21]
  #10 /usr/bin/python3() [0x53bcfb]
  #11 /usr/bin/python3(PyObject_Call+0xc1) [0x53c361]
  #12 /usr/bin/python3(_PyEval_EvalFrameDefault+0x23fb) [0x513e8b]
  #13 /usr/bin/python3() [0x5106ed]
  #14 /usr/bin/python3(_PyFunction_Vectorcall+0x361) [0x528d21]
  #15 /usr/bin/python3() [0x53be7e]
  #16 /usr/bin/python3(_PyEval_EvalFrameDefault+0x23fb) [0x513e8b]
  #17 /usr/bin/python3() [0x5106ed]
  #18 /usr/bin/python3(_PyFunction_Vectorcall+0x361) [0x528d21]
  #19 /usr/bin/python3() [0x53be7e]
  #20 /usr/bin/python3(_PyEval_EvalFrameDefault+0x23fb) [0x513e8b]
  #21 /usr/bin/python3() [0x5106ed]
  #22 /usr/bin/python3(_PyFunction_Vectorcall+0x361) [0x528d21]
  #23 /usr/bin/python3() [0x53be7e]
  #24 /usr/bin/python3(_PyEval_EvalFrameDefault+0x23fb) [0x513e8b]
  #25 /usr/bin/python3() [0x5106ed]
  #26 /usr/bin/python3(_PyEval_EvalCodeWithName+0x47) [0x510497]
  #27 /usr/bin/python3(PyEval_EvalCode+0x23) [0x5f5be3]
  #28 /usr/bin/python3() [0x619de7]
  #29 /usr/bin/python3() [0x615610]
  #30 /usr/bin/python3() [0x619d79]
  #31 /usr/bin/python3(PyRun_SimpleFileExFlags+0x196) [0x619816]
  #32 /usr/bin/python3(Py_RunMain+0x2b3) [0x60d4e3]
  #33 /usr/bin/python3(Py_BytesMain+0x29) [0x5ea6e9]
  #34 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xea) [0x7ffff7c5dd0a]
  #35 /usr/bin/python3(_start+0x2a) [0x5ea5ea]

Here's what I'm doing: it is a new host, with fresh samba 4.16 install
(debian build), the command:

  samba-tool domain join tls.msk.ru MEMBER -U mjt-adm

and here's the smb.conf's global section:

[global]
         dedicated keytab file = /etc/krb5.keytab
         disable spoolss = Yes
         kerberos method = secrets and keytab
         netbios name = WH
         realm = TLS.MSK.RU
         security = ADS
         server role = member server
         winbind use default domain = Yes
         workgroup = TLS

How to print the python types in gdb?

Thanks,

/mjt

